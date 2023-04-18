local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "gopls",
  "html",
  "pyright",
  "marksman",
  "rust_analyzer",
  "tsserver",
  "yamlls",
  "clangd",
  "taplo",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
