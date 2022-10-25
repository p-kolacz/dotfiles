Help.map(Help.Type.CHEATSHEET, "https://devhints.io/go")
Help.map(Help.Type.MANUAL,     "https://go.dev/doc/effective_go")
Help.map(Help.Type.STDLIB,     "https://pkg.go.dev/std")
Help.map(Help.Type.TOOLS,      "https://go.dev/doc/cmd")

nnoremap("<localleader>r", ":!go run .<cr>", "run file")
nnoremap("<localleader>t", ":!go mod tidy<cr>", "mod tidy")
nnoremap("<localleader>b", ':!go build -ldflags "-s -w"<cr>', "build")

