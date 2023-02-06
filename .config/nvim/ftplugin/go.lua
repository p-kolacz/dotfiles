Helper.map {
	CHEATSHEET = "https://devhints.io/go",
	MANUAL     = "https://go.dev/doc/effective_go",
	STDLIB     = "https://pkg.go.dev/std",
	TOOLS      = "https://go.dev/doc/cmd",
}

nnoremap("<localleader>r", ":!go run .<cr>", "run file")
nnoremap("<localleader>t", ":!go mod tidy<cr>", "mod tidy")
nnoremap("<localleader>b", ':!go build -ldflags "-s -w"<cr>', "build")

-- https://github.com/golang/tools/tree/master/gopls

Laser.start {
	cmd = { "gopls" },
}
