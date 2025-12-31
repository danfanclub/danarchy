return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- Configures how markdown is rendered
    -- See :h render-markdown for full options
  },
  ft = { "markdown" }, -- Only load for markdown files
}
