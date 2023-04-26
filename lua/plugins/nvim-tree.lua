require('nvim-tree').setup {
  filters = { dotfiles = true },
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local scr_w = vim.opt.columns:get()
        local scr_h = vim.opt.lines:get()
        local win_w = math.floor(scr_w * 0.5)
        local win_h = math.floor(scr_h * 0.7)
        return {
          border = 'rounded',
          relative = 'editor',
          row = (scr_h - win_h) / 2,
          col = (scr_w - win_w) / 2,
          width = win_w,
          height = win_h,
        }
      end,
    },
  },
}
