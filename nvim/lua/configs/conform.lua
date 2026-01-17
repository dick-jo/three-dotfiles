local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettierd" },
    css = { "prettierd" },
    typescript = { "prettierd" },
    javascript = { "prettierd" },
    svelte = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascriptreact = { "prettierd" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
