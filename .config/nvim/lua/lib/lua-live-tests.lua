local ns = vim.api.nvim_create_namespace("live-tests")

vim.cmd("highlight TestSuccess guifg=#56d364")
vim.cmd("highlight TestFailure guifg=#f97583")

local run_command = function(bufnr, command)
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
  local tests = {}

  -- print("jobstart")
  vim.fn.jobstart(command, {
	
    stdout_buffered = true,
    -- For some reason, busted / vusted -o json outputs the result on stderr instead of stdout
    on_stdout = function(_, data)
      local start_line = 1
      -- There might be unrelated stuff printed to the screen, skip that part
      if data then
        while data[start_line] and not data[start_line]:find('{".*}') do
          start_line = start_line + 1
        end
      end
      if data[start_line] then
        local decoded = vim.json.decode(data[start_line])
        tests = vim.tbl_map(function(success)
          return { success = true, line = success.trace.currentline, name = success.name }
        end, decoded.successes)

        for _, failure in ipairs(vim.tbl_deep_extend("force", decoded.errors, decoded.failures)) do
          table.insert(tests, {
            success = false,
            line = failure.element.trace.currentline,
            name = failure.name,
            message = failure.message,
          })
        end
      end
    end,

    on_exit = function(_)
      local failed = {}
      for _, test in ipairs(tests) do
        local text = test.success and { "✓", "TestSuccess" } or { "× Test failed", "TestFailure" }
        vim.api.nvim_buf_set_extmark(bufnr, ns, test.line - 1, 0, {
          virt_text = { text },
        })

        if not test.success then
          table.insert(failed, {
            bufnr = bufnr,
            lnum = test.line,
            col = 0,
            severity = vim.diagnostic.severity.ERROR,
            source = "live-tests",
            message = test.message,
            user_data = {},
          })
        end
      end
      vim.diagnostic.set(ns, bufnr, failed, {})
    end,
  })
end

local add_command = function(command)
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("inspired-by-teej", { clear = true }),
    pattern = "*spec.lua",
    callback = function(opts)
      command[2] = opts.file
      run_command(opts.buf, command)
    end,
  })
end

add_command({ "busted", nil, "-o", "json" })

