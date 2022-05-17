local M = {}

function M.setup()
  local status_ok, neogit = pcall(require, 'neogit')
  if not status_ok then
    vim.fn.append('neogit not ok')
    return
  end

  neogit.setup { disable_commit_configuration = true, disable_signs = true }
end

return M
