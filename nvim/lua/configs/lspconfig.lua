-- configs/lspconfig.lua
-- Uses nvim 0.11+ vim.lsp.config / vim.lsp.enable (old require('lspconfig') wrapper
-- is deprecated and removed in nvim-lspconfig v3). Default server configs ship
-- inside nvim-lspconfig's lsp/ dir and are picked up automatically on enable.
-- rust-analyzer is configured by rustaceanvim in plugins/init.lua, not here.

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

vim.diagnostic.config {
  -- virtual_lines wraps long diagnostics onto their own line instead of overflowing
  -- off the right side. current_line = true keeps them scoped to the cursor line only.
  virtual_text = false,
  virtual_lines = { current_line = true },
  signs = true,
  underline = true,
}
