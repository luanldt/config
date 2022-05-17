local M  = {}

local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"

---Join path segments that were passed as input
---@return string
function M:join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

function M:is_directory(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory" or false
end


return M
