local M = {}

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end


local window_width_limit = 70
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > window_width_limit
  end
}

M.setup = function()

  local configs = {
    options = {
      icons_enabled = true,
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      theme = 'auto',
      disabled_filetypes = { "alpha", "NvimTree", "Outline" },
      globalstatus = false,
    },
    sections = {
      lualine_a = {
        {
          function()
            return " "
          end,
          padding = { left = 0, right = 0 },
          color = {},
          cond = nil,
        }
      },
      lualine_b = {'branch', 'filename'},
      lualine_c = {
        {
          "diff",
          source = diff_source,
          symbols = { added = "  ", modified = " ", removed = " " },
          diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.yellow },
            removed = { fg = colors.red },
          },
          cond = nil,
        }
      },
      lualine_x = {
        'encoding', 
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          cond = conditions.hide_in_width,
        },
        {
          function()
            local b = vim.api.nvim_get_current_buf()
            if next(vim.treesitter.highlighter.active[b]) then
              return ""
            end
            return ""
          end,
          color = { fg = colors.green },
          cond = conditions.hide_in_width,
        },
        {
          "filetype", cond = conditions.hide_in_width 
        },
      },
      lualine_y = {'progress'},
      lualine_z = {
        {
          function()
            local current_line = vim.fn.line "."
            local total_lines = vim.fn.line "$"
            local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return chars[index]
          end,
          padding = { left = 0, right = 0 },
          color = { fg = colors.yellow, bg = colors.bg },
          cond = nil,
        }
      }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {'nvim-tree'},
  }

  local status_ok, lualine = pcall(require, 'lualine')
  if not status_ok then
    return
  end

  lualine.setup(configs)

end

return M
