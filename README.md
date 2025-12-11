# My neovim config.

## Requirements:-
- [XClip](https://github.com/astrand/xclip)
- [Neovim](https://neovim.io) >= 0.10.0
- [Git](https://git-scm.com)
- [NerdFont](https://www.nerdfonts.com/)
- [Lazygit](https://github.com/jesseduffield/lazygit) (Optional)
- C Compiler
- [Rust](https://www.rust-lang.org/tools/install)
- [riggrep](https://github.com/BurntSushi/ripgrep) for telescope
- [npm](https://www.npmjs.com/)

### Config Structure

```

.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── init.lua
    │   ├── keymap.lua
    │   ├── lazy.lua
    │   ├── lsp.lua
    │   └── options.lua
    ├── lsp
    │   ├── blink.lua
    │   ├── friendly-snippets.lua
    │   ├── luasnip.lua
    │   ├── mason-lspconfig.lua
    │   ├── mason-tool-installer.lua
    │   ├── mason.lua
    │   └── nvim-lspconfig.lua
    └── plugin
        ├── bufferline.lua
        ├── lualine.lua
        ├── nvim-autopairs.lua
        ├── nvim-cursorline.lua
        ├── nvim-tree.lua
        ├── nvim-treesitter.lua
        ├── telescope.lua
        └── vim-tmux-navigator.lua

5 directories, 23 files

```
