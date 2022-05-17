vim.g.do_filetype_lua = 1 -- global variable active the Lua filetype direction mechanism, runs before the legacy Vim script file type detection
vim.g.did_load_filetype = 0 -- disable filetype.vim, only using filetype.lua

require 'impatient'.enable_profile()

require 'bootstrap':init()
require 'configs.lsp'.setup()




-- Settings

local cmd = vim.cmd
-- Commands
require('onedark').load()

cmd [[command! BufferKill packadd packer.nvim | lua require('configs.bufferline').buf_kill('bd') ]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
