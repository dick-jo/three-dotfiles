return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- TREESITTER
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "scss",
        "json",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      auto_install = true,
    },
  },

  -- TREESITTER TEXT OBJECTS
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- NVIM TREE
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      -- Your existing settings
      git = {
        enable = true,
        ignore = false,
      },
      filters = {
        dotfiles = false,
        custom = {
          "^.git$",
          "^node_modules$",
          "^.DS_Store$",
          "^dist$",
          "^.next$",
          "^.svelte-kit$",
          "^build$",
          "^coverage$",
        },
      },
      view = {
        adaptive_size = true, -- This is the key setting!
        preserve_window_proportions = true,
      },
      actions = {
        open_file = {
          resize_window = false,
          quit_on_open = false,
        },
      },
      renderer = {
        icons = {
          webdev_colors = true,
        },
      },
    },
  },

  -- TELESCOPE
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        hidden = true, -- show hidden files
        file_ignore_patterns = {
          "node_modules/.*",
          ".git/.*",
          ".DS_Store",
          "dist/.*",
          "build/.*",
          ".next/.*", -- for Next.js builds
          "coverage/.*",
          ".env.local", -- but keep .env visible!
        },
      },
    },
  },

  -- SNACKS
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = { enabled = true },
      lazygit = { enabled = true },
      indent = {
        enabled = true,
        scope = {
          enabled = true,
        },
        animate = {
          enabled = false, -- Instant scope highlighting
        },
      },
      scroll = { enabled = true }, -- Smooth scrolling
    },
  },

  -- SIDEKICK
  {
    "folke/sidekick.nvim",
    lazy = false,
    opts = {
      nes = {
        enabled = false, -- Disable Neovim Editor Suggestions
      },
      cli = {
        mux = {
          enabled = false, -- Keep this disabled since you don't use tmux/zellij
        },
      },
      win = {
        layout = "right", -- or "bottom" if you prefer horizontal split
        split = {
          width = 0, -- 0 = use default vim split width (50/50)
          height = 0, -- 0 = use default vim split height (50/50)
        },
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send { msg = "{this}" }
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send { msg = "{file}" }
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send { msg = "{selection}" }
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle { name = "claude", focus = true }
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },

  -- SNIPPETS
  {
    "L3MON4D3/LuaSnip",
    opts = {
      -- other options if any
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
      vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/lua_snippets"
      require "lua_snippets"
    end,
  },

  -- INDENT
  -- MIGRATED TO SNACKS - Keep this commented for reference until confirmed working
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   config = function()
  --     require("configs.indent-blankline").setup()
  --   end,
  -- },

  -- SCROLL
  -- MIGRATED TO SNACKS - Keep this commented for reference until confirmed working
  -- {
  --   "karb94/neoscroll.nvim",
  --   lazy = false,
  --   config = function()
  --     require("neoscroll").setup {
  --       -- Smooth scrolling for various commands
  --       mappings = {
  --         "<C-u>",
  --         "<C-d>",
  --         "<C-b>",
  --         "<C-f>",
  --         "<C-y>",
  --         "<C-e>",
  --         "zt",
  --         "zz",
  --         "zb",
  --       },
  --       hide_cursor = true, -- Hide cursor while scrolling
  --       stop_eof = true, -- Stop at EOF when scrolling downwards
  --       respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin
  --       cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  --       easing_function = "circular", -- Options: quadratic, cubic, quartic, quintic, circular, sine
  --       pre_hook = nil, -- Function to run before the scrolling animation starts
  --       post_hook = nil, -- Function to run after the scrolling animation ends
  --       performance_mode = false, -- Disable "Performance Mode" on all movements
  --     }
  --   end,
  -- },

  -- SURROUND
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
