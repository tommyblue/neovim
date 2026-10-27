--
-- ~/.config/nvim/lua/plugins/codecompanion.lua
--

-- This configuration is designed for a plugin manager like lazy.nvim.
-- It returns a Lua table that specifies the plugin to be loaded and its configuration.
return {
  -- The GitHub repository for the codecompanion.nvim plugin.
  "olimorris/codecompanion.nvim",

  version = "^19.0.0",

  -- Specifies other plugins that codecompanion.nvim needs to function correctly.
  dependencies = {
    -- plenary.nvim provides common utility functions that are used by many Neovim plugins.
    {"nvim-lua/plenary.nvim"},
    {"ravitemer/codecompanion-history.nvim"},
    {"ravitemer/mcphub.nvim"},
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          -- These 4 parsers are mandatory for CodeCompanion's UI and Agent system
          ensure_installed = { "lua", "markdown", "markdown_inline", "yaml" },
          highlight = { enable = true },
        })
      end
    },
  },

  -- The 'opts' table contains all the user-specific settings for the plugin.
  opts = {
    log_level = "DEBUG",
    display = {
      action_palette = {
        provider = "telescope", -- or "mini.pick" / "default"
      },
    },
    -- This 'strategies' table sets the DEFAULT AI PROVIDER and MODEL
    -- for different categories of actions within the plugin.
    strategies = {
      -- Configures the default model for running custom prompts.
      cmd = {
        adapter = "ollama",
        model = "gemma4:12b",
      },

      -- Configures the model for the interactive chat window (:CompanionChat).
      chat = {
        adapter = "ollama",
        model = "gemma4:12b",
        tools = {
          opts = {
            auto_submit_success = true,  -- Automatically submit the tool's output back to the LLM
            auto_submit_errors = false, -- Stop and let you see if a tool failed
          },
          -- Enable specific tools the LLM can call
          ["cmd"] = {
              enable = true,
              opts = {
                shell = vim.o.shell,
              }
          },
          ["files"] = { enable = true },       -- Allows viewing workspace files
          ["file_editor"] = { enable = true }, -- Allows editing/creating files
        },
        slash_commands = {
          ["file"] = {
            callback = "strategies.chat.slash_commands.file",
            description = "Insert a file into the chat",
            opts = { contains_code = true },
          },
          ["buffer"] = {
            callback = "strategies.chat.slash_commands.buffer",
            description = "Insert a buffer into the chat",
            opts = { contains_code = true },
          },
        },
      },

      -- Configures the model for any action that modifies code directly in your buffer
      -- using the 'inline' strategy.
      inline = {
        adapter = "ollama",
        model = "gemma4:12b",
      },
    },
  },
}
