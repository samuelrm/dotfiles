return {
  -- Disables the bottom statusline (returns to default Neovim status bar)
  { "nvim-lualine/lualine.nvim", enabled = false },
  -- Disables the top buffer tabs
  { "akinsho/bufferline.nvim", enabled = false },
  -- Disables the floating command bar and custom message UI
  { "folke/noice.nvim", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      indent = { enabled = false },
      notifier = { enabled = false },
      scroll = { enabled = false },
    },
  },
}
