-- Bootstrap lazy.nvim
require("nvim-theme")
vim.api.nvim_create_user_command("ReloadTheme", function ()
  package.loaded["nvim-theme"] = nil
  require("nvim-theme")
end, {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- LSP
	{
		"neovim/nvim-lspconfig"
	},

	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		}
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip"
	},

    -- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
    lazy = false,
		build = ":TSUpdate",
    ensure_installed = {
      "lua", "bash", "python", "json", "yaml", "qml", 
    },
  },
})

-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.clipboard:append("unnamedplus")

-- Setup Treesitter
local ts = require('nvim-treesitter')
ts.setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
  highlight = { enable = true },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

-- Setup LSP
vim.lsp.config("lua_ls", {})
vim.lsp.enable("lua_ls")

vim.lsp.config("pyright", {})
vim.lsp.enable("pyright")

vim.lsp.config("clangd", {})
vim.lsp.enable("clangd")

vim.lsp.config("bashls", {})
vim.lsp.enable("bashls")

vim.lsp.config("jsonls", {})
vim.lsp.enable("jsonls")

vim.lsp.config("ts_ls", {})
vim.lsp.enable("ts_ls")

vim.lsp.config("yamlls", {})
vim.lsp.enable("yamlls")

vim.lsp.config("qmlls", {})
vim.lsp.enable("qmlls")

-- Setup autocomplete
local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true}),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
})
