local M = {}

function M.setup()
  local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lsp_status_ok then
    return
  end


  local utils = require('utils')
  local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
  if lsp_settings_status_ok then
    lsp_settings.setup {
      config_home = utils:join_paths(vim.call("stdpath", "config"), "lsp-settings"),
      append_default_schemas = true,
    }
  end

  local configs = {
    virtual_text = true,
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
      format = function(d)
        local t = vim.deepcopy(d)
        local code = d.code or (d.user_data and d.user_data.lsp.code)
        if code then
          t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
        end
        return t.message
      end,
    },
  }

  vim.diagnostic.config(configs)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, configs.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, configs.float)


  local lsp_status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
  if not lsp_status_ok then
    return
  end
  nvim_lsp_installer.setup {
    automatic_installation = true
  }
  lspconfig.sumneko_lua.setup {}
end

return M
