local servers = {
  { "pyright", {} },
  -- { "pylsp", {} },
  { "lua_ls", {}, mason = true },
  { "rust_analyzer", {} },
  { "clangd", {} },
  { "omnisharp", {} },
  { "jdtls", {} },
  {
    "tsserver",
    {
      settings = {
        completions = {
          completeFunctionCalls = true,
        },
      },
    },
  },
  { "cssls", {} },
  { "html", {} },
  { "phpactor", {} },
  { "tailwindcss", {} },
}

local function table_combine(t1, t2)
  local new_table = {}
  for k, v in pairs(t1) do
    new_table[k] = v
  end
  for k, v in pairs(t2) do
    new_table[k] = v
  end
  return new_table
end

local function grab_server_names()
  local new_table = {}
  for _, server in ipairs(servers) do
    local needs_mason = false
    if server.mason ~= nil then
      needs_mason = server.mason
    end
    if needs_mason == true then
      table.insert(new_table, server[1])
    end
  end
  return new_table
end

return {
  {
    "preservim/tagbar",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = {
      multiline_threshold = 1,
      mode = "topline",
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        rust = { "rustfmt" },
      },
    },
    init = function()
      local map = require "custom.mappings"
      map.conform = {
        n = {
          ["<leader>fm"] = {
            function()
              require("conform").format()
              vim.cmd "w"
              print "Formatted and Saved"
            end,
            "Format and Save File",
          },
        },
      }
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    requires = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = grab_server_names(),
        automatic_installation = false,
      }
      local configs = require "plugins.configs.lspconfig"
      local function lsp_init(lsp, opt)
        opt = opt or {}
        opt = table_combine(opt, {
          on_attach = configs.on_attach,
          capabilities = configs.capabilities,
          flags = {
            debounce_text_changes = 150,
          },
        })
        require("lspconfig")[lsp].setup(opt)
      end
      for _, server in ipairs(servers) do
        lsp_init(server[1], server[2])
      end
    end,
  },
}
