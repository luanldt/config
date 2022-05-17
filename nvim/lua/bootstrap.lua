local M = {}

function M:init()
    local settings = require('configs.settings')
    settings:load_options()

    vim.g.mapleader = ","
end

return M
