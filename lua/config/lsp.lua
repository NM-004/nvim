vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})


vim.lsp.config('tsserver',{
	cmd = {'typescript-language-server', '--stdio'},
  filetypes = {'typescript', 'javascript', 'typescriptreact', 'javascriptreact'},
  root_dir = vim.fs.root(0, {'package.json', 'tsconfig.json', '.git'})
})

vim.lsp.config('pyright',{
	cmd = {'pyright'},
        filetypes = {'python','python3'},
	root_dir = vim.fs.root(0, {'pyproject.toml', 'setup.py', '.git'})
})

vim.lsp.enable('luals')
vim.lsp.enable('tsserver')
vim.lsp.enable('pyright')
