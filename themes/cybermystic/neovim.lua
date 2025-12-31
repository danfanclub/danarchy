-- Artforge Theme for Neovim (Cybermystic variant)
-- Deep purple cyberpunk aesthetic with fuschia highlights

return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				-- Artforge color palette
				local colors = {
					-- Base colors
					base00 = "#1C021F", -- Default background: Deep purple
					base01 = "#000000", -- Lighter background (status bars): Purple
					base02 = "#6a1a32", -- Selection background: Purple-red
					base03 = "#9a6b9e", -- Comments, invisibles: Muted purple
					base04 = "#ff6b9d", -- Dark foreground: Hot pink
					base05 = "#ff5c8a", -- Default foreground: Bright fuschia
					base06 = "#ffe0a8", -- Light foreground: Light fuschia
					base07 = "#fd7be7", -- Light background: Cream

					-- Accent colors
					base08 = "#ff4757", -- Variables: Bright red
					base09 = "#ff9a56", -- Integers, constants: Orange-gold
					base0A = "#ffd93d", -- Classes, types: Gold
					base0B = "#6EE7B7", -- Strings: Mint green (HIGHLIGHT)
					base0C = "#c77dff", -- Support, regex: Purple
					base0D = "#06d6f9", -- Functions, keywords: Electric blue (HIGHLIGHT)
					base0E = "#e76f99", -- Keywords: Magenta-pink
					base0F = "#d4a373", -- Deprecated: Muted gold
				}

				-- Reset highlighting
				vim.cmd("highlight clear")
				if vim.fn.exists("syntax_on") then
					vim.cmd("syntax reset")
				end

				vim.o.termguicolors = true
				vim.o.background = "dark"
				vim.g.colors_name = "artforge"

				local hl = vim.api.nvim_set_hl

				-- Editor highlights
				hl(0, "Normal", { fg = colors.base05, bg = colors.base00 })
				hl(0, "NormalNC", { fg = colors.base04, bg = "#160119" }) -- Dimmed inactive windows
				hl(0, "NormalFloat", { fg = colors.base05, bg = colors.base01 })
				hl(0, "FloatBorder", { fg = colors.base0E, bg = colors.base01 })
				hl(0, "FloatTitle", { fg = colors.base0A, bg = colors.base01, bold = true })
				hl(0, "Cursor", { fg = colors.base00, bg = colors.base0E })
				hl(0, "CursorLine", { bg = colors.base01 })
				hl(0, "CursorLineNr", { fg = colors.base0A, bold = true })
				hl(0, "LineNr", { fg = colors.base03 })
				hl(0, "Visual", { bg = colors.base02 })
				hl(0, "VisualNOS", { bg = colors.base02 })
				hl(0, "Search", { fg = colors.base00, bg = colors.base0A })
				hl(0, "IncSearch", { fg = colors.base00, bg = colors.base0E })
				hl(0, "MatchParen", { fg = colors.base0D, bold = true })

				-- Syntax highlighting
				hl(0, "Comment", { fg = colors.base03, italic = true })
				hl(0, "Constant", { fg = colors.base09 })
				hl(0, "String", { fg = colors.base0B })
				hl(0, "Character", { fg = colors.base0B })
				hl(0, "Number", { fg = colors.base09 })
				hl(0, "Boolean", { fg = colors.base09 })
				hl(0, "Float", { fg = colors.base09 })
				hl(0, "Identifier", { fg = colors.base05 })
				hl(0, "Function", { fg = colors.base0D })
				hl(0, "Statement", { fg = colors.base0E })
				hl(0, "Conditional", { fg = colors.base0E })
				hl(0, "Repeat", { fg = colors.base0E })
				hl(0, "Label", { fg = colors.base08 })
				hl(0, "Operator", { fg = colors.base06 })
				hl(0, "Keyword", { fg = colors.base0E })
				hl(0, "Exception", { fg = colors.base08 })
				hl(0, "PreProc", { fg = colors.base0C })
				hl(0, "Include", { fg = colors.base0C })
				hl(0, "Define", { fg = colors.base0C })
				hl(0, "Macro", { fg = colors.base0C })
				hl(0, "PreCondit", { fg = colors.base0C })
				hl(0, "Type", { fg = colors.base0A })
				hl(0, "StorageClass", { fg = colors.base0A })
				hl(0, "Structure", { fg = colors.base0A })
				hl(0, "Typedef", { fg = colors.base0A })
				hl(0, "Special", { fg = colors.base0D })
				hl(0, "SpecialChar", { fg = colors.base0D })
				hl(0, "Tag", { fg = colors.base0E })
				hl(0, "Delimiter", { fg = colors.base06 })
				hl(0, "SpecialComment", { fg = colors.base03, italic = true, bold = true })
				hl(0, "Debug", { fg = colors.base08 })
				hl(0, "Underlined", { underline = true })
				hl(0, "Error", { fg = colors.base08, bold = true })
				hl(0, "Todo", { fg = colors.base0A, bold = true })

				-- UI elements
				hl(0, "StatusLine", { fg = colors.base05, bg = colors.base02 })
				hl(0, "StatusLineNC", { fg = colors.base03, bg = colors.base01 })
				hl(0, "TabLine", { fg = colors.base03, bg = colors.base02 })
				hl(0, "TabLineFill", { bg = colors.base01 })
				hl(0, "TabLineSel", { fg = colors.base0E, bg = colors.base00, bold = true })
				hl(0, "Pmenu", { fg = colors.base05, bg = colors.base01 })
				hl(0, "PmenuSel", { fg = colors.base0A, bg = colors.base02, bold = true })
				hl(0, "PmenuSbar", { bg = colors.base02 })
				hl(0, "PmenuThumb", { bg = colors.base08 })
				hl(0, "WildMenu", { fg = colors.base00, bg = colors.base0E })
				hl(0, "VertSplit", { fg = colors.base0A, bg = "NONE" }) -- Autumn gold separator
				hl(0, "WinSeparator", { fg = colors.base0A, bg = "NONE" }) -- Autumn gold separator
				hl(0, "Folded", { fg = colors.base03, bg = colors.base01 })
				hl(0, "FoldColumn", { fg = colors.base0C, bg = colors.base00 })
				hl(0, "SignColumn", { fg = colors.base08, bg = colors.base00 })
				hl(0, "ColorColumn", { bg = colors.base01 })

				-- Diff highlighting
				hl(0, "DiffAdd", { fg = colors.base0B, bg = colors.base01 })
				hl(0, "DiffChange", { fg = colors.base0D, bg = colors.base01 })
				hl(0, "DiffDelete", { fg = colors.base08, bg = colors.base01 })
				hl(0, "DiffText", { fg = colors.base06, bg = colors.base02, bold = true })

				-- Git signs
				hl(0, "GitSignsAdd", { fg = colors.base0B })
				hl(0, "GitSignsChange", { fg = colors.base0D })
				hl(0, "GitSignsDelete", { fg = colors.base08 })

				-- Diagnostic highlights
				hl(0, "DiagnosticError", { fg = colors.base08 })
				hl(0, "DiagnosticWarn", { fg = colors.base0A })
				hl(0, "DiagnosticInfo", { fg = colors.base0D })
				hl(0, "DiagnosticHint", { fg = colors.base0C })
				hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.base08 })
				hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.base0A })
				hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.base0D })
				hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.base0C })

				-- LSP highlights
				hl(0, "LspReferenceText", { bg = colors.base02 })
				hl(0, "LspReferenceRead", { bg = colors.base02 })
				hl(0, "LspReferenceWrite", { bg = colors.base02, underline = true })

				-- Treesitter highlights
				hl(0, "@variable", { fg = colors.base05 })
				hl(0, "@variable.builtin", { fg = colors.base09 })
				hl(0, "@variable.parameter", { fg = colors.base06 })
				hl(0, "@variable.member", { fg = colors.base04 })
				hl(0, "@constant", { fg = colors.base09 })
				hl(0, "@constant.builtin", { fg = colors.base09 })
				hl(0, "@constant.macro", { fg = colors.base0A })
				hl(0, "@module", { fg = colors.base0A })
				hl(0, "@module.builtin", { fg = colors.base0A })
				hl(0, "@label", { fg = colors.base08 })
				hl(0, "@string", { fg = colors.base0B })
				hl(0, "@string.escape", { fg = colors.base0D })
				hl(0, "@string.special", { fg = colors.base0D })
				hl(0, "@string.regexp", { fg = colors.base0C })
				hl(0, "@character", { fg = colors.base0B })
				hl(0, "@character.special", { fg = colors.base0D })
				hl(0, "@boolean", { fg = colors.base09 })
				hl(0, "@number", { fg = colors.base09 })
				hl(0, "@number.float", { fg = colors.base09 })
				hl(0, "@type", { fg = colors.base0A })
				hl(0, "@type.builtin", { fg = colors.base0A })
				hl(0, "@type.definition", { fg = colors.base0A })
				hl(0, "@attribute", { fg = colors.base0C })
				hl(0, "@property", { fg = colors.base04 })
				hl(0, "@function", { fg = colors.base0D })
				hl(0, "@function.builtin", { fg = colors.base0D })
				hl(0, "@function.call", { fg = colors.base0D })
				hl(0, "@function.macro", { fg = colors.base0C })
				hl(0, "@function.method", { fg = colors.base0D })
				hl(0, "@function.method.call", { fg = colors.base0D })
				hl(0, "@constructor", { fg = colors.base0A })
				hl(0, "@operator", { fg = colors.base06 })
				hl(0, "@keyword", { fg = colors.base0E })
				hl(0, "@keyword.coroutine", { fg = colors.base0E })
				hl(0, "@keyword.function", { fg = colors.base0E })
				hl(0, "@keyword.operator", { fg = colors.base0E })
				hl(0, "@keyword.import", { fg = colors.base0C })
				hl(0, "@keyword.conditional", { fg = colors.base0E })
				hl(0, "@keyword.repeat", { fg = colors.base0E })
				hl(0, "@keyword.return", { fg = colors.base0E })
				hl(0, "@keyword.exception", { fg = colors.base08 })
				hl(0, "@comment", { fg = colors.base03, italic = true })
				hl(0, "@comment.documentation", { fg = colors.base03, italic = true })
				hl(0, "@punctuation", { fg = colors.base06 })
				hl(0, "@punctuation.bracket", { fg = colors.base06 })
				hl(0, "@punctuation.delimiter", { fg = colors.base06 })
				hl(0, "@punctuation.special", { fg = colors.base0D })
				hl(0, "@tag", { fg = colors.base0E })
				hl(0, "@tag.attribute", { fg = colors.base0A })
				hl(0, "@tag.delimiter", { fg = colors.base06 })

				-- Telescope
				hl(0, "TelescopeBorder", { fg = colors.base0E })
				hl(0, "TelescopePromptBorder", { fg = colors.base08 })
				hl(0, "TelescopeResultsBorder", { fg = colors.base09 })
				hl(0, "TelescopePreviewBorder", { fg = colors.base0C })
				hl(0, "TelescopeSelection", { fg = colors.base0A, bg = colors.base02, bold = true })
				hl(0, "TelescopeMatching", { fg = colors.base0E, bold = true })

				-- Neo-tree (custom colors from original)
				hl(0, "NeoTreeNormal", { fg = colors.base05, bg = "#000000" })
				hl(0, "NeoTreeNormalNC", { fg = colors.base05, bg = "#000000" })
				hl(0, "NeoTreeEndOfBuffer", { fg = "#000000", bg = "#000000" })
				hl(0, "NeoTreeWinSeparator", { fg = colors.base0A, bg = "#000000" })
				hl(0, "NeoTreeCursorLine", { bg = "#4a0000" })
				hl(0, "NeoTreeDirectoryName", { fg = colors.base09 })
				hl(0, "NeoTreeDirectoryIcon", { fg = "#ff743d" })
				hl(0, "NeoTreeFileName", { fg = "#8345b7" })
				hl(0, "NeoTreeFileIcon", { fg = "#f62d1c" })
				hl(0, "NeoTreeIndentMarker", { fg = colors.base03 })
				hl(0, "NeoTreeRootName", { fg = colors.base0E, bold = true })
				hl(0, "NeoTreeGitModified", { fg = colors.base0D })
				hl(0, "NeoTreeGitAdded", { fg = colors.base0B })
				hl(0, "NeoTreeGitDeleted", { fg = colors.base08 })

				-- Terminal colors
				vim.g.terminal_color_0 = colors.base01
				vim.g.terminal_color_1 = colors.base08
				vim.g.terminal_color_2 = colors.base0B
				vim.g.terminal_color_3 = colors.base0A
				vim.g.terminal_color_4 = colors.base0D
				vim.g.terminal_color_5 = colors.base0E
				vim.g.terminal_color_6 = colors.base0C
				vim.g.terminal_color_7 = colors.base06
				vim.g.terminal_color_8 = colors.base02
				vim.g.terminal_color_9 = "#ff6666"
				vim.g.terminal_color_10 = "#7cd699"
				vim.g.terminal_color_11 = "#ffee77"
				vim.g.terminal_color_12 = "#44ddff"
				vim.g.terminal_color_13 = "#ff99bb"
				vim.g.terminal_color_14 = "#dd99ff"
				vim.g.terminal_color_15 = "#ffffff"
			end,
		},
	},
}
