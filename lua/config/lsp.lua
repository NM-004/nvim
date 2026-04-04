require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
    ensure_installed ={
        "lua_ls",
        "stylua",
        "ts_ls",
        "pyright",
        "clangd",
        --"pylsp",
        "docker-language-server",
        "docker-compose-language-service",
        "json-lsp",
        "tailwindcss-language-server",
        "prisma-language-server"
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
    root_dir = vim.fs.root(0, {'package.json', 'tsconfig.json', '.git','jsconfig.json'})
})

vim.lsp.config('tailwindcss-language-server',{
    cmd = {'tailwindcss-language-server', '--stdio'},
    filetypes = {'typescript', 'javascript', 'typescriptreact', 'javascriptreact'},
    root_dir = vim.fs.root(0, {'package.json', 'tsconfig.json', '.git'})
})

vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },  -- this is the correct cmd
    filetypes = { 'python' },
    root_markers = { 'pyrightconfig.json', 'pyproject.toml', 'setup.py', '.git','requirements.txt' },
})

vim.lsp.config('docker-language-server',{
    cmd = { 'docker-language-server', 'start','--stdio' },
    --cmd = {'pyright'},
    filetypes = { 'dockerfile', 'yaml.docker-compose' },
    --root_dir = vim.fs.root(0, {'pyproject.toml', 'setup.py', '.git'})
    root_markers = { 'Dockerfile','docker-compose.yaml','docker-compose.yml','compose.yaml','compose.yml','docker-bake.json','docker-bake.hcl','docker-bake.override.json','docker-bake.override.hcl',}
})

vim.lsp.config('json-lsp',{
    --cmd = { 'docker-language-server', 'start' },
    --cmd = {'pyright'},
    filetypes = {'json'},
    --root_dir = vim.fs.root(0, {'pyproject.toml', 'setup.py', '.git'})
})

vim.lsp.config('clangd', {
    cmd = {'clangd'},
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = {'.clangd', 'compile_commands.json','.clang-tidy','configure.ac'}	
})

vim.lsp.config('prisma-language-server', {
    cmd = { 'prisma-language-server', '--stdio' },  -- this is the correct cmd
    filetypes = { 'prisma' },
    root_markers = { 'package.json','.git'}
})

vim.filetype.add({
  pattern = {
    ["docker%-compose%.ya?ml"] = "yaml.docker-compose",
    ["compose%.ya?ml"] = "yaml.docker-compose",
  },
})

vim.lsp.config('docker-compose-language-service', {
    cmd = { 'docker-compose-langserver', '--stdio' },
    filetypes = { 'yaml.docker-compose' },
    root_markers = {'docker-compose.yaml', 'docker-compose.yml', 'compose.yaml', 'compose.yml'},
    single_file_support = true,
})


--vim.lsp.config('pylsp', {
--	cmd = {'pylsp'},
--	filetypes = {'python'},
--})

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
    'lua_ls',
    'ts_ls',
    'tailwindcss',
    'pyright',
    'docker_language_server',
    "docker-compose-language-service",
    'jsonls',
    'clangd',
    'prisma-language-server'
})

--vim.cmd('set completeopt+=noselect')
require("luasnip.loaders.from_vscode").lazy_load()

-- Global diagnostic configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', '●', etc.
        spacing = 4,
        severity = { min = vim.diagnostic.severity.ERROR }, -- Show from INFO and above
    },
    signs = true,          -- Show signs in the sign column
    underline = false,      -- Underline problematic code
    update_in_insert = false, -- Don't update diagnostics while inserting
    severity_sort = true,  -- Sort diagnostics by severity
    float = {
        focusable = false,   -- Floating window not focusable
        style = "minimal",
        border = "rounded",
        source = "if_many",   -- Show source of diagnostic
        header = "",
        prefix = "",
    },
})

-- Optionally, you can customize signs icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    underline = false,
    virtual_lines = {
        severity = { min = vim.diagnostic.severity.INFO }
    }
})

vim.keymap.set('n', '<leader>d', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })
