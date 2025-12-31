return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#18011d", -- Default background
                base01 = "#bf3654", -- Lighter background (status bars)
                base02 = "#18011d", -- Selection background
                base03 = "#bf3654", -- Comments, invisibles
                base04 = "#ffc7a4", -- Dark foreground
                base05 = "#ffffff", -- Default foreground
                base06 = "#ffffff", -- Light foreground
                base07 = "#ffc7a4", -- Light background

                -- Accent colors (base08-base0F)
                base08 = "#d65353", -- Variables, errors, red
                base09 = "#eb9e9e", -- Integers, constants, orange
                base0A = "#f6c553", -- Classes, types, yellow
                base0B = "#8ebb7f", -- Strings, green
                base0C = "#8debff", -- Support, regex, cyan
                base0D = "#6d80ec", -- Functions, keywords, blue
                base0E = "#f177f0", -- Keywords, storage, magenta
                base0F = "#fde5aa", -- Deprecated, brown/yellow
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
