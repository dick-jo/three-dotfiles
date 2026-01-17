-- configs/lspconfig.lua
local lspconfig = require "lspconfig"

-- Simple on_attach - just for debugging
-- local on_attach = function(client, bufnr)
--   print("✅ LSP connected: " .. client.name .. " for " .. vim.bo[bufnr].filetype)
-- That's it! NvChad handles the keymaps
-- end

-- Your language servers
lspconfig.ts_ls.setup { on_attach = on_attach }
lspconfig.svelte.setup {
  on_attach = on_attach,
  settings = {
    svelte = {
      plugin = {
        html = { enable = true },
        css = { enable = true },
        typescript = { enable = true },
      },
    },
  },
}
lspconfig.cssls.setup { on_attach = on_attach }
lspconfig.html.setup { on_attach = on_attach }
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
}

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
}

vim.lsp.enable("copilot", {
  cmd = { "copilot-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
})
