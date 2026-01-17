require "nvchad.mappings"

local map = vim.keymap.set

-- add yours here
map("n", "<C-z>", "<Nop>")
map("i", "<C-z>", "<Nop>")
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

-- Terminal mappings using F-keys
map({ "n", "t" }, "<F2>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<F3>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<F4>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
--

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Sidekick NES navigation
map("n", "<M-CR>", function()
  require("sidekick").nes_jump_or_apply()
end, { desc = "Sidekick Goto/Apply Edit Suggestion" })

-- Lazygit (Folke's recommended binding)
map("n", "<leader>gg", function()
  require("snacks").lazygit()
end, { desc = "Lazygit" })

-- Disable smooth scroll for gg/G (instant jump to top/bottom)
map("n", "gg", function()
  Snacks.scroll.disable()
  vim.cmd("normal! gg")
  vim.schedule(function()
    Snacks.scroll.enable()
  end)
end, { desc = "Jump to top (no smooth scroll)" })

map("n", "G", function()
  Snacks.scroll.disable()
  vim.cmd("normal! G")
  vim.schedule(function()
    Snacks.scroll.enable()
  end)
end, { desc = "Jump to bottom (no smooth scroll)" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
