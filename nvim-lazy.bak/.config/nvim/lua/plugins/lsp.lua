return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "clangd",
        "css-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
      })
    end,
  },
}
