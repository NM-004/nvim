require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"pyright",
		"clangd",
		--"pylsp",
		"docker-language-server",
		"docker-compose-language-service",
		"json-lsp",
		"tailwindcss-language-server",
		"prisma-language-server",
		"prettier",
		"stylua",
		"isort",
		"black",
		"pylint",
		"eslint_d",
		"clang-format",
		"jdtls",
	},
})

vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
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
	root_markers = { ".luarc.json", ".luarc.jsonc" },
})

vim.lsp.config("jdtls", {
	cmd = { "jdtls" },
	filetypes = { "java", "class" },
})

vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git", "jsconfig.json" }),
})

vim.lsp.config("tailwindcss-language-server", {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git" }),
})

vim.lsp.config("pyright", {
	cmd = { "pyright-langserver", "--stdio" }, -- this is the correct cmd
	filetypes = { "python" },
	root_markers = { "pyrightconfig.json", "pyproject.toml", "setup.py", ".git", "requirements.txt" },
})

vim.lsp.config("docker-language-server", {
	cmd = { "docker-language-server", "start", "--stdio" },
	filetypes = { "dockerfile", "yaml.docker-compose" },
	root_markers = {
		"Dockerfile",
		"docker-compose.yaml",
		"docker-compose.yml",
		"compose.yaml",
		"compose.yml",
		"docker-bake.json",
		"docker-bake.hcl",
		"docker-bake.override.json",
		"docker-bake.override.hcl",
	},
})

vim.lsp.config("json-lsp", {
	filetypes = { "json" },
})

vim.lsp.config("clangd", {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_markers = { ".clangd", "compile_commands.json", ".clang-tidy", "configure.ac" },
})

vim.lsp.config("prisma-language-server", {
	cmd = { "prisma-language-server", "--stdio" }, -- this is the correct cmd
	filetypes = { "prisma" },
	root_markers = { "package.json", ".git" },
})

vim.filetype.add({
	pattern = {
		["docker%-compose%.ya?ml"] = "yaml.docker-compose",
		["compose%.ya?ml"] = "yaml.docker-compose",
	},
})

vim.lsp.config("docker-compose-language-service", {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "yaml.docker-compose" },
	root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
	single_file_support = true,
})

--  vim.api.nvim_create_autocmd('LspAttach', {
--      group = vim.api.nvim_create_augroup('my.lsp', {}),
--      callback = function(args)
--      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--if client:supports_method('textDocument/completion') then
--vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
--end
--end,
--})
--
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"pyright",
	"docker_language_server",
	"docker-compose-language-service",
	"jsonls",
	"clangd",
	"prisma-language-server",
	"jdtls",
})

--vim.cmd('set completeopt+=noselect')
require("luasnip.loaders.from_vscode").lazy_load()

-- Global diagnostic configuration
--vim.diagnostic.config({
--    underline = false,
--    virtual_lines = {
--        severity = { min = vim.diagnostic.severity.INFO }
--    }
--})

--local virtual_lines_enabled = false
--
--vim.keymap.set('n', '<leader>d', function()
--    virtual_lines_enabled = not virtual_lines_enabled
--    vim.diagnostic.config({
--        virtual_lines = virtual_lines_enabled,
--        virtual_text = not virtual_lines_enabled,
--    })
--end, { desc = 'Toggle diagnostic view' })

local diag_float_win = nil

vim.keymap.set("n", "<leader>p", function()
	if diag_float_win and vim.api.nvim_win_is_valid(diag_float_win) then
		-- close if already open
		vim.api.nvim_win_close(diag_float_win, true)
		diag_float_win = nil
	else
		-- open and store window id
		diag_float_win = vim.diagnostic.open_float(nil, {
			border = "rounded",
			source = "always",
		})
	end
end, { desc = "Toggle diagnostic float" })
