-- Runs after $VIMRUNTIME/ftplugin/rust.vim and rustaceanvim's ftplugin.
-- Soft-wrap long lines so shrinking the window (e.g. opening sidekick or a
-- split) doesn't force horizontal scrolling through 99-col rust code.
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
