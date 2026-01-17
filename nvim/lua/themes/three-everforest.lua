-- Credits to original https://github.com/sainnhe/everforest
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#FEEDCA", -- ie tabufline ink
  darker_black = "#1b1b1b",
  black = "#1b1b1b", -- nvim bg
  black2 = "#323a40",
  one_bg = "#2a2a2a",
  one_bg2 = "#2a2a2a", -- nvim tree right border
  one_bg3 = "#2a2a2a", -- Theme switch toggle bg?
  grey = "#2a2a2a", -- Line numbers
  grey_fg = "#565656", -- Comment
  grey_fg2 = "#626a70", -- ???
  light_grey = "#727272", -- Statusline git branch; some syntax errors?
  red = "#FF6AC1",
  baby_pink = "#d699b6",
  pink = "#FF6AC1",
  line = "#2a2a2a", -- for lines like vertsplit
  green = "#83c092",
  vibrant_green = "#a7c080",
  nord_blue = "#58C6FF",
  blue = "#58C6FF",
  yellow = "#dbbc7f",
  sun = "#d1b171",
  purple = "#ecafcc",
  dark_purple = "#d699b6",
  teal = "#69a59d",
  orange = "#e69875",
  cyan = "#95d1c9",
  statusline_bg = "#121212",
  lightbg = "#424242",
  pmenu_bg = "#83c092",
  folder_bg = "#FEEDCA",
}

M.base_16 = {
  base00 = "#121212", -- Default Background (ie. editor bg)
  base01 = "#420000",
  base02 = "#4200AA",
  base03 = "#d699b6",
  base04 = "#FFFF00",
  base05 = "#FEEDCA",
  base06 = "#FF00FF",
  base07 = "#F0701A",
  base08 = "#58C6FF",
  base09 = "#FECAFE",
  base0A = "#83c092",
  base0B = "#dbbc7f",
  base0C = "#ffb20f",
  base0D = "#a7c080",
  base0E = "#FF6AC1",
  base0F = "#d699b6",
}

M.type = "dark"

M.polish_hl = {
  treesitter = {
    ["@variable.css"] = { fg = M.base_16.base05 },
    ["@tag.delimiter"] = { fg = M.base_16.base0C },
    Special = { fg = M.base_16.base0C },

    -- Template literal interpolation
    ["@punctuation.special"] = { fg = M.base_16.base0C },
    ["@string.escape"] = { fg = M.base_16.base0C },
    ["@string.template"] = { fg = M.base_16.base0C },

    -- TypeScript/TSX specific
    ["@type.typescript"] = { fg = M.base_16.base0A },
    ["@type.tsx"] = { fg = M.base_16.base0A },
    ["@constructor.typescript"] = { fg = M.base_16.base0D },
    ["@constructor.tsx"] = { fg = M.base_16.base0D },

    -- JSX/TSX component names
    ["@tag.tsx"] = { fg = M.base_16.base09 },
    ["@tag.attribute.tsx"] = { fg = M.base_16.base07 },

    -- Svelte
    -- ["@tag.svelte"] = { fg = M.base_16.base0C },
    -- ["@tag.delimiter.svelte"] = { fg = M.base_16.base0C },
    -- ["@tag.attribute.svelte"] = { fg = M.base_16.base07 },
  },
}

-- M = require("base46").override_theme(M, "everforest")

return M
