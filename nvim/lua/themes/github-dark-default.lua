-- GitHub Dark Default theme
-- Based on GitHub's official Primer design system
-- https://primer.style/primitives/colors

local M = {}

M.base_30 = {
  white = "#e6edf3",           -- Primary text
  darker_black = "#010409",    -- Deeper than canvas
  black = "#0d1117",           -- Canvas default (main bg)
  black2 = "#161b22",          -- Canvas subtle
  one_bg = "#161b22",          -- Slightly lighter bg
  one_bg2 = "#21262d",         -- Tree/sidebar bg
  one_bg3 = "#30363d",         -- Subtle borders
  grey = "#484f58",            -- Line numbers
  grey_fg = "#6e7681",         -- Muted text
  grey_fg2 = "#8b949e",        -- Comments
  light_grey = "#b1bac4",      -- Light muted
  red = "#ff7b72",             -- Danger/errors
  baby_pink = "#ffa198",       -- Light red
  pink = "#ff7b72",            -- Red emphasis
  line = "#21262d",            -- Split lines
  green = "#7ee787",           -- Success/strings (some contexts)
  vibrant_green = "#56d364",   -- Bright green
  nord_blue = "#79c0ff",       -- Info blue
  blue = "#58a6ff",            -- Primary blue
  yellow = "#f0883e",          -- Warning/attention
  sun = "#ffa657",             -- Orange
  purple = "#d2a8ff",          -- Functions/special
  dark_purple = "#bc8cff",     -- Dark purple
  teal = "#56d4dd",            -- Cyan-ish
  orange = "#ffa657",          -- Variables/params
  cyan = "#a5d6ff",            -- Strings
  statusline_bg = "#161b22",   -- Statusline
  lightbg = "#30363d",         -- Lighter elements
  pmenu_bg = "#58a6ff",        -- Popup menu accent
  folder_bg = "#58a6ff",       -- Folder icons
}

M.base_16 = {
  base00 = "#0d1117",  -- Default background
  base01 = "#161b22",  -- Lighter background (statuslines, line numbers)
  base02 = "#21262d",  -- Selection background
  base03 = "#8b949e",  -- Comments
  base04 = "#6e7681",  -- Dark foreground (status, invisibles)
  base05 = "#e6edf3",  -- Default foreground (variables, identifiers)
  base06 = "#f0f6fc",  -- Light foreground
  base07 = "#ffffff",  -- Brightest foreground
  base08 = "#7ee787",  -- Tags (green) - used for HTML/JSX tags
  base09 = "#79c0ff",  -- Numbers, booleans (blue)
  base0A = "#ffa657",  -- Types, classes (orange)
  base0B = "#a5d6ff",  -- Strings (light blue)
  base0C = "#56d4dd",  -- Regex, escape chars (cyan)
  base0D = "#d2a8ff",  -- Functions (purple)
  base0E = "#ff7b72",  -- Keywords (red) - import, from, type, const, etc.
  base0F = "#ffa198",  -- Deprecated, embedded (light red)
}

M.type = "dark"

M.polish_hl = {
  treesitter = {
    -- Variables and identifiers (white)
    ["@variable"] = { fg = M.base_16.base05 },
    ["@variable.parameter"] = { fg = M.base_16.base05 },
    ["@variable.member"] = { fg = M.base_16.base05 },

    -- Functions (purple)
    ["@function"] = { fg = M.base_16.base0D },
    ["@function.call"] = { fg = M.base_16.base0D },
    ["@function.method"] = { fg = M.base_16.base0D },
    ["@function.builtin"] = { fg = M.base_16.base0D },

    -- Keywords (red)
    ["@keyword"] = { fg = M.base_16.base0E },
    ["@keyword.function"] = { fg = M.base_16.base0E },
    ["@keyword.return"] = { fg = M.base_16.base0E },
    ["@keyword.operator"] = { fg = M.base_16.base0E },
    ["@keyword.import"] = { fg = M.base_16.base0E },

    -- Strings (light blue)
    ["@string"] = { fg = M.base_16.base0B },
    ["@string.escape"] = { fg = M.base_16.base09 },
    ["@string.special"] = { fg = M.base_16.base09 },

    -- Types (orange)
    ["@type"] = { fg = M.base_16.base0A },
    ["@type.builtin"] = { fg = M.base_16.base0E },
    ["@type.qualifier"] = { fg = M.base_16.base0E },
    ["@constructor"] = { fg = M.base_16.base0A },

    -- Constants (blue)
    ["@constant"] = { fg = M.base_16.base09 },
    ["@constant.builtin"] = { fg = M.base_16.base09 },
    ["@number"] = { fg = M.base_16.base09 },
    ["@boolean"] = { fg = M.base_16.base09 },

    -- Tags (green for tag names)
    ["@tag"] = { fg = M.base_16.base08 },
    ["@tag.attribute"] = { fg = M.base_16.base05 },
    ["@tag.delimiter"] = { fg = M.base_16.base05 },

    -- Comments (gray)
    ["@comment"] = { fg = M.base_16.base03 },

    -- Punctuation (white/default)
    ["@punctuation.bracket"] = { fg = M.base_16.base05 },
    ["@punctuation.delimiter"] = { fg = M.base_16.base05 },
    ["@punctuation.special"] = { fg = M.base_16.base05 },

    -- Operators
    ["@operator"] = { fg = M.base_16.base0E },

    -- Properties
    ["@property"] = { fg = M.base_16.base05 },

    -- Special
    Special = { fg = M.base_16.base09 },

    -- TypeScript/JavaScript specific
    ["@variable.css"] = { fg = M.base_16.base05 },
    ["@type.typescript"] = { fg = M.base_16.base0A },
    ["@type.tsx"] = { fg = M.base_16.base0A },
    ["@constructor.typescript"] = { fg = M.base_16.base0A },
    ["@constructor.tsx"] = { fg = M.base_16.base0A },

    -- JSX/TSX (green for component names)
    ["@tag.tsx"] = { fg = M.base_16.base08 },
    ["@tag.attribute.tsx"] = { fg = M.base_16.base05 },
    ["@tag.delimiter.tsx"] = { fg = M.base_16.base05 },
  },
}

return M
