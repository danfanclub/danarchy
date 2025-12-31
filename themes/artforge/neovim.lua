return {
	{
		"bjarneo/aether.nvim",
		name = "artforge",
		priority = 1000,
		opts = {
			disable_italics = false,
			colors = {
				-- Monotone shades (base00-base07)
				base00 = "#1C021F", -- Default background: Deep purple
				base01 = "#a31a45", -- Lighter background (status bars): Purple
				base02 = "#6a1a32", -- Selection background: Purple-red
				base03 = "#9a6b9e", -- Comments, invisibles: Muted purple
				base04 = "#ff6b9d", -- Dark foreground: Hot pink
				base05 = "#ff5c8a", -- Default foreground: Bright fuschia
				base06 = "#ff85a8", -- Light foreground: Light fuschia
				base07 = "#fd7be7", -- Light background: Cream

				-- Accent colors (base08-base0F)
				base08 = "#ff4757", -- Variables: Bright red
				base09 = "#ff9a56", -- Integers, constants: Orange-gold
				base0A = "#ffd93d", -- Classes, types: Gold
				base0B = "#6EE7B7", -- Strings: Mint green (HIGHLIGHT)
				base0C = "#c77dff", -- Support, regex: Purple
				base0D = "#06d6f9", -- Functions, keywords: Electric blue (HIGHLIGHT)
				base0E = "#e76f99", -- Keywords: Magenta-pink
				base0F = "#d4a373", -- Deprecated: Muted gold
			},
		},
		config = function(_, opts)
			-- Force RGB colors immediately (override terminal colors)
			vim.opt.termguicolors = true

			-- Function to apply all custom highlight overrides
			local function apply_custom_highlights()
				vim.schedule(function()
					-- Core text colors (override terminal defaults)
					vim.api.nvim_set_hl(0, "Normal", { fg = "#ff5c8a", bg = "#1C021F" }) -- Bright fuschia text on deep purple

					-- NeoTree folder colors
					vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#ff743d" }) -- Folder icons: Gold
					vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#ff9a56" }) -- Folder names: Orange-gold

					-- NeoTree file colors
					vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#f62d1c" }) -- File icons: Magenta-pink
					vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#8345b7" }) -- File names: Hot pink

					-- NeoTree indent markers
					vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#9a6b9e" }) -- Indent lines: Muted purple

					-- NvimTree (in case you switch)
					vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#ffd93d" })
					vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#ff9a56" })
					vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#9a6b9e" })

					-- Dashboard/splash screen colors
					vim.api.nvim_set_hl(0, "Title", { fg = "#ffd93d", bold = true }) -- Neovim logo: Gold
					vim.api.nvim_set_hl(0, "Special", { fg = "#06d6f9" }) -- Icons/special chars: Electric blue
				end)
			end

			-- Initial setup
			require("aether").setup(opts)
			vim.cmd.colorscheme("artforge")

			-- Enable hot reload
			require("aether.hotreload").setup()

			-- Apply custom highlights on initial load
			apply_custom_highlights()

			-- Re-apply setup AND custom highlights when colorscheme is changed
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "artforge",
				callback = function()
					require("aether").setup(opts)
					apply_custom_highlights()
				end,
			})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "artforge",
		},
	},
}
