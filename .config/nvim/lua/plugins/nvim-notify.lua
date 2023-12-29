return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>xn",
      function(opts)
        require("telescope").extensions.notify.notify(opts)
      end,
      desc = "Telescope notifications",
    },
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    timeout = 2000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.4)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
    top_down = false,
  },
  init = function() end,
}
