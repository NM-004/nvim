return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "html", "javascript", "typescript", "tsx", "vue", "c", "json5"
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
