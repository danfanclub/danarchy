return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#241b2f", -- Default background
                base01 = "#495495", -- Lighter background (status bars)
                base02 = "#241b2f", -- Selection background
                base03 = "#495495", -- Comments, invisibles
                base04 = "#f7f7f7", -- Dark foreground
                base05 = "#ffffff", -- Default foreground
                base06 = "#ffffff", -- Light foreground
                base07 = "#f7f7f7", -- Light background

                -- Accent colors (base08-base0F)
                base08 = "#fe4450", -- Variables, errors, red
                base09 = "#fe4450", -- Integers, constants, orange
                base0A = "#fede5d", -- Classes, types, yellow
                base0B = "#72f1b8", -- Strings, green
                base0C = "#36f9f6", -- Support, regex, cyan
                base0D = "#03edf9", -- Functions, keywords, blue
                base0E = "#ff7edb", -- Keywords, storage, magenta
                base0F = "#fede5d", -- Deprecated, brown/yellow
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")

            -- Enable hot reload
            require("aether.hotreload").setup()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
