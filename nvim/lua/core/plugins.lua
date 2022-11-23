local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	--[[ use "github/copilot.vim" ]]
	use("nvim-treesitter/nvim-treesitter")
	use("wellle/context.vim")
	use("airblade/vim-rooter")
	-- use "mhinz/vim-startify"
	use("majutsushi/tagbar")
	use("w0rp/ale")
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	use("junegunn/vim-easy-align")
	use("Shatur/neovim-ayu")
	use("ellisonleao/gruvbox.nvim")
	use("folke/tokyonight.nvim")
	use("elzr/vim-json")
	use("othree/html5.vim")
	-- use "evanleck/vim-svelte"
	-- use "Himujjal/tree-sitter-svelte"
	use("leafOfTree/vim-svelte-plugin")
	use("hail2u/vim-css3-syntax")
	--[[ use "pangloss/vim-javascript" ]]
	use("mattn/emmet-vim")
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("kdheepak/tabline.nvim")
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				plugins = {
					presets = {
						operators = false,
					},
				},
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- auto-session
	use({
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({})
		end,
	})

	-- Colorschemes
	use({ "koenverburg/peepsight.nvim" })
	use({
		"mrshmllow/document-color.nvim",
		config = function()
			require("document-color").setup({
				-- Default options
				mode = "background", -- "background" | "foreground" | "single"
			})
		end,
	})
	use("norcalli/nvim-colorizer.lua")
	use("easymotion/vim-easymotion")
	-- SearchBox
	use("MunifTanjim/nui.nvim")
	use("VonHeikemen/searchbox.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use("nvim-lua/lsp-status.nvim")
	use("lukas-reineke/lsp-format.nvim")
	use("onsails/lspkind.nvim")
	-- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				filter_kind = {
					"Class",
					"Constant",
					"Constructor",
					"Enum",
					"Function",
					"Interface",
					"Module",
					"Method",
					"Struct",
				},
			})
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})
	use("nvim-telescope/telescope-fzf-native.nvim")
	--[[ use({ "edluffy/hologram.nvim" }) ]]

	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- Smoooooth scrolling
	use("declancm/cinnamon.nvim")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("nvim-telescope/telescope-media-files.nvim")
	use("rafaqz/ranger.vim")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "1.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal" },
							},
						},
						other_win_hl_color = "#1C77E9",
					})
				end,
			},
		},
	})

	-- Parenthesis highlighting
	use("p00f/nvim-ts-rainbow")
	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	-- Git Diff View
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use("rcarriga/nvim-notify")

	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
	})
	--[[ use("simrat39/symbols-outline.nvim") ]]

	use("rmagatti/goto-preview")
	use("sunjon/shade.nvim")
	use("metakirby5/codi.vim")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use({
		"mvllow/modes.nvim",
		tag = "v0.2.0",
		config = function()
			require("modes").setup()
		end,
	})
	use("tpope/vim-surround")
	use("AndrewRadev/tagalong.vim")
	use("tpope/vim-repeat")
	use("windwp/nvim-ts-autotag")
	use({
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("noice").setup()
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})
	use("glepnir/lspsaga.nvim")
	use("zbirenbaum/neodim")
	use {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
