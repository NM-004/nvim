require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
	ensure_installed ={
		"lua_ls",
		"stylua",
		"ts_ls",
		"pyright",
		"clangd"
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
	cmd = { 'pyright' },
	--cmd = {'pyright'},
        filetypes = {'python'},
	--root_dir = vim.fs.root(0, {'pyproject.toml', 'setup.py', '.git'})
})

vim.lsp.config('clangd', {
	cmd = {'clangd'},
	filetypes = {'c', 'cpp'},
	root_markers = {'.clangd', 'compile_commands.json'}	
})

vim.lsp.config('pylsp', {
	cmd = {'pylsp'},
	filetypes = {'python'},
})


--vim.lsp.enable('lua_ls')
--vim.lsp.enable('ts_ls')
--vim.lsp.enable('pyright')

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
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },				}
			}
		
	},
})

-- Global diagnostic configuration
--vim.diagnostic.config({
--  virtual_text = {
--    prefix = '●', -- Could be '■', '▎', '●', etc.
--    spacing = 4,
--    severity = { min = vim.diagnostic.severity.INFO }, -- Show from INFO and above
--  },
--  signs = true,          -- Show signs in the sign column
--  underline = false,      -- Underline problematic code
--  update_in_insert = false, -- Don't update diagnostics while inserting
--  severity_sort = true,  -- Sort diagnostics by severity
--  float = {
--    focusable = false,   -- Floating window not focusable
--    style = "minimal",
--    border = "rounded",
--    source = "if_many",   -- Show source of diagnostic
--    header = "",
--    prefix = "",
--  },
--})

-- Optionally, you can customize signs icons
--local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
--for type, icon in pairs(signs) do
--  local hl = "DiagnosticSign" .. type
--  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--end

vim.diagnostic.config({
	underline = false
})

vim.keymap.set('n', '<leader>d', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

