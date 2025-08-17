require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
	ensure_installed ={
		"lua_ls",
		"stylua",
		"ts_ls",
		"pyright"
	}
})

vim.lsp.config('lua_ls', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})


vim.lsp.config('ts_ls',{
	cmd = {'typescript-language-server', '--stdio'},
  filetypes = {'typescript', 'javascript', 'typescriptreact', 'javascriptreact'},
  root_dir = vim.fs.root(0, {'package.json', 'tsconfig.json', '.git'})
})

vim.lsp.config('pyright',{
	cmd = {'pyright'},
        filetypes = {'python','python3'},
	root_dir = vim.fs.root(0, {'pyproject.toml', 'setup.py', '.git'})
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('pyright')

--  vim.api.nvim_create_autocmd('LspAttach', {
--      group = vim.api.nvim_create_augroup('my.lsp', {}),
--      callback = function(args)
	--      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        --if client:supports_method('textDocument/completion') then
          --vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        --end
      --end,
    --})

--vim.cmd('set completeopt+=noselect')
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		list = {
			selection = { preselect = true, auto_insert = true }
		},
		documentation = { 
			auto_show = true,
			auto_show_delay_ms = 500
		}
	},
	menu = {
		auto_show = true,
		draw = {
			treesitter = {'lsp'},
			columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
		}
	}
})
