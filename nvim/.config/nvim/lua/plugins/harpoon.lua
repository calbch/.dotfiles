-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

return {
  "ThePrimeagen/harpoon",
  event = "BufRead",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,
  keys = {
    {
      "<leader>fa",
      function()
        require("harpoon"):list():append()
      end,
      desc = "Harpoon Add File",
    },
    {
      "<leader>fu",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon toggle menu",
    },
    {
      "<leader>fj",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon goto file 1",
    },
    {
      "<leader>fk",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon goto file 2",
    },
    {
      "<leader>fl",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon goto file 3",
    },
    {
      "<leader>fx",
      function()
        require("harpoon"):list():clear()
      end,
      desc = "Harpoon empy list",
    },
    -- TODO: add keybinding to wait for user input and remove the index from the list
  },
}
