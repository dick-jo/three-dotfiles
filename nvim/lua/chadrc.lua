-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options 🙁

---@type ChadrcConfig
local M = {}

M.base46 = {
  ---@diagnostic disable-next-line: assign-type-mismatch
  theme = "three-everforest",
  transparency = true,

  -- hl_override = {
  --  Comment = { italic = true },
  --  ["@comment"] = { italic = true },
  -- },
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "block",
    order = nil,
    modules = nil,
  },
}

return M
