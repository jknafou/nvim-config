return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "latex", },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "c", "rust" },  -- Disable for C/Rust (uses regex-based)
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,  -- Required for context-aware indentation
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },  -- Better than "after" for lazy.nvim
    config = function()
      require("treesitter-context").setup({
        enable = true,
        mode = "cursor",  -- 'topline' or 'cursor'
        max_lines = 3,    -- Show up to 3 context lines
        multiline_threshold = 5,  -- Min lines for multi-line context
        separator = "─",  -- Visual separator line
        zindex = 20,
        on_attach = function(bufnr)
          -- Optional: Add keymaps for context navigation
          vim.keymap.set("n", "[c", function() require("treesitter-context").go_to_context() end, { buffer = bufnr })
        end
      })
    end
  }
}

