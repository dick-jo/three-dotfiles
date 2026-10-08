local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "oxfmt", "prettierd", stop_after_first = true },
    css = { "oxfmt", "prettierd", stop_after_first = true },
    typescript = { "oxfmt", "prettierd", stop_after_first = true },
    javascript = { "oxfmt", "prettierd", stop_after_first = true },
    svelte = { "prettierd" },
    typescriptreact = { "oxfmt", "prettierd", stop_after_first = true },
    javascriptreact = { "oxfmt", "prettierd", stop_after_first = true },
    rust = { "rustfmt" },
  },

  formatters = {
    -- only in repos that configure oxfmt; everywhere else falls through to prettierd
    oxfmt = { require_cwd = true },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
