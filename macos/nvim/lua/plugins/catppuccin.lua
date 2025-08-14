return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensures the plugin loads early to avoid flashing
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- Set the flavor to Frappé
        background = { -- Optional: Set background for light/dark modes
          light = "frappe",
          dark = "frappe",
        },
        transparent_background = false, -- Set to true for transparent background
        integrations = { -- Enable integrations for plugins
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          -- Add other integrations as needed
        },
      })
      vim.cmd.colorscheme("catppuccin") -- Apply the colorscheme
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin", -- Ensure LazyVim uses Catppuccin
    },
  },
}
