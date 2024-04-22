return {

  -- cheatsheet.nvim --
  -- https://github.com/sudormrfbin/cheatsheet.nvim
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      bundled_cheatsheets = {
        disabled = { "nerd-fonts", "unicode" },
      },
    },
  },

  -- Comment.nvim --
  -- https://github.com/numToStr/Comment.nvim
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
}
