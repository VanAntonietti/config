return {
  {
    "Exafunction/codeium.nvim",
    config = function(_, opts)
      require("codeium").setup(opts)
      vim.cmd("Codeium Toggle")
    end,
  },
}
