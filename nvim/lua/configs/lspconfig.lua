-- configs/lspconfig.lua
-- Uses nvim 0.11+ vim.lsp.config / vim.lsp.enable (old require('lspconfig') wrapper
-- is deprecated and removed in nvim-lspconfig v3). Default server configs ship
-- inside nvim-lspconfig's lsp/ dir and are picked up automatically on enable.
-- rust-analyzer is configured by rustaceanvim in plugins/init.lua, not here.

-- Our plugin spec for nvim-lspconfig overrides NvChad's `config` function, so
-- NvChad's defaults() (LSP keymaps gD/gd/<leader>ra, on_init to drop semantic
-- tokens, completion capabilities, lua_ls setup, float border) never runs
-- automatically. Call it explicitly here, then override what we want.
require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("svelte", {
  settings = {
    svelte = {
      plugin = {
        html = { enable = true },
        css = { enable = true },
        typescript = { enable = true },
      },
    },
  },
})

vim.lsp.config("emmet_ls", {
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
})

vim.lsp.enable {
  "ts_ls",
  "svelte",
  "cssls",
  "html",
  "emmet_ls",
  "wgsl_analyzer",
}

local severity = vim.diagnostic.severity

vim.diagnostic.config {
  -- virtual_text: always-visible colored EOL marker per diagnostic (at-a-glance scan).
  -- virtual_lines on current line: full, wrapped message below the cursor line so
  -- long messages are readable without overflowing off the right side.
  virtual_text = {
    spacing = 4,
    source = "if_many",
  },
  virtual_lines = { current_line = true },
  signs = {
    text = {
      [severity.ERROR] = "󰅙",
      [severity.WARN] = "",
      [severity.INFO] = "󰋼",
      [severity.HINT] = "󰌵",
    },
  },
  underline = true,
}

-- Background tints for the EOL virtual-text blurb. Most themes leave
-- DiagnosticVirtualText* with only a fg, which on a custom/minimal theme makes
-- the blurb blend into the code. We preserve each severity's theme fg and add
-- a subtle dark-tinted bg so the blurb pops at a glance.
local function apply_diag_vtext_bg()
  local tints = {
    Error = "#3a1f26",
    Warn = "#3a331f",
    Info = "#1f2f3a",
    Hint = "#1f3a28",
  }
  for name, bg in pairs(tints) do
    local base = vim.api.nvim_get_hl(0, { name = "Diagnostic" .. name, link = false })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. name, { fg = base.fg, bg = bg })
  end
end
apply_diag_vtext_bg()
vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_diag_vtext_bg })
