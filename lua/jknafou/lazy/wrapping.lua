return {
  "andrewferrier/wrapping.nvim",
  config = function()
    require("wrapping").setup({
      -- Optional: customize options here. For example:
      -- auto_set_mode_filetype_allowlist = { "markdown", "text", "latex" },
      -- create_commands = true,    -- default: true
      -- create_keymaps = true,     -- default: true
    })
  end,
  -- Optional: load only for text-like filetypes
  ft = { "markdown", "text", "latex", "asciidoc", "rst", "gitcommit", "mail", "tex" },
}
