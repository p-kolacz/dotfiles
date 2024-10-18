Plugin "https://github.com/diepm/vim-rest-console"

vim.g.vrc_trigger = '<F5>'
vim.g.vrc_response_default_content_type = 'application/json'
vim.g.vrc_split_request_body = 1
vim.g.vrc_show_command = 1
vim.g.vrc_curl_opts = {
	['--silent'] = '',
	['--show-error'] = '',
}

