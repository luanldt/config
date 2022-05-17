local M = {}

function M.setup()
  local status_ok, gitsigns = pcall(require, 'gitsigns')
  if not status_ok then
    vim.fn.append('gitsigns not ok')
    return
  end

  gitsigns.setup { 
    signs = {
      add = { hl = 'GreenSign', text = '│', numhl = 'GitSignsAddNr' },
      change = { hl = 'BlueSign', text = '│', numhl = 'GitSignsChangeNr' },
      delete = { hl = 'RedSign', text = '│', numhl = 'GitSignsDeleteNr' },
      topdelete = { hl = 'RedSign', text = '│', numhl = 'GitSignsDeleteNr' },
      changedelete = { hl = 'PurpleSign', text = '│', numhl = 'GitSignsChangeNr' },
    },
    keymaps = {},
  }
end

return M
