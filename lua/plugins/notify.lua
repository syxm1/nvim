return {
  "rcarriga/nvim-notify",
  config = function()
  local nvim_notify = require("notify")
  nvim_notify.setup({
    nvim_notify._config(),
    background_color = "#000000",
    level = 1,
    fps = 60,
    render = "compact",
    stages = "static",
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T",
    },
    timeout = 2000,
    top_down = true,
  })
  vim.notify = nvim_notify
  end,
},

