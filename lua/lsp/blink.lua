return{
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    build = 'cargo build --release',
    config = function()
        require("blink.cmp").setup({
            signature = { enabled = true },
            completion = {
                list = {
                    selection = { preselect = false, auto_insert = false }
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
            keymap = {
                preset = "none",
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'hide', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },

                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

                ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
            }
        })

    end
}
