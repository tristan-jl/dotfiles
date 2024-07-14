-- Set up lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Set python path
vim.g.python3_host_prog = vim.env.HOME .. "/opt/venv/bin/python"
-- Set leader before plugins
vim.g.mapleader = " "

require("lazy").setup({ import = "custom/plugins" }, { change_detection = { notify = false } })
