local packer = nil
local function init()

  if packer == nil then
    packer = require 'packer'
    packer.init { disable_commands = true }
  end

  local use = packer.use
  packer.reset()

  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

  use 'navarasu/onedark.nvim'

  use { "neovim/nvim-lspconfig" }
  use { "tamago324/nlsp-settings.nvim" }
  use { "williamboman/nvim-lsp-installer" }


  use 'kyazdani42/nvim-web-devicons' 

  -- NvimTree
  use {
    "kyazdani42/nvim-tree.lua",
    --  event = "BufWinOpen",
    -- cmd = "NvimTreeToggle",
    config = function()
      require("configs.nvimtree").setup()
    end,
  }


  -- Undo tree
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }

  -- Git
  use {
    { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('configs.gitsigns').setup()
      end,
    },
    { 
      'TimUntersberger/neogit', 
      cmd = 'Neogit', 
      config = function()
        require('configs.neogit').setup()
      end,
    },
  }

  --  Whichkey
  use {
    "folke/which-key.nvim",
    config = function()
      require("configs.whichkey").setup()
    end,
    event = "BufWinEnter"
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter").setup()
    end,
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    config = function()
      require("configs.autopairs").setup()
    end,
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    branch = "main",
    config = function()
      require("configs.terminal").setup()
    end
  }

  -- Status Line and Bufferline
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine").setup()
    end,
  }

  use {
    "akinsho/bufferline.nvim",
    config = function()
      require("configs.bufferline").setup()
    end,
    branch = "main",
    event = "BufWinEnter",
  }

end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
