local workspaces = {
    notes = '~/Notes/'
}

vim.g.maplocalleader = ' '

require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
            }
        },
        ["core.dirman"] = {
            config = {
                use_popup = false,
                workspaces = workspaces,
                default_workspace = "notes",
                index = 'index.norg'
            },
        },
        ["core.dirman.utils"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.highlights"] = {},
        ["core.integrations.image"] = {
            config = {
            }
        },
        ["core.latex.renderer"] = {
            config = {
                conceal = true,
                render_on_enter = false,
                debounce_ms = 2000,
                min_length=3
            }
        },
        ["core.concealer"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp"
            },
        },
        ["core.summary"] = {
            config = {
                strategy = "default"
            }
        }
    }
})

-- set conceal levels for concealer

vim.cmd([[
    set conceallevel=3
    set concealcursor=nvic
]])
