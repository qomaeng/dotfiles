local plugin = 'lspconfig'

if packer_plugins[plugin] and packer_plugins[plugin].loaded then
  local lspconfig = require'lspconfig'

  local nnoremap = function(key, cmd)
    vim.api.nvim_buf_set_keymap(0, 'n', key, cmd, { noremap = true, silent = true })
  end

  nnoremap('gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
  nnoremap('gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
  nnoremap('K', '<CMD>lua vim.lsp.buf.hover()<CR>')
  nnoremap('gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
  --nnoremap('<C-k>', '<CMD>lua vim.lsp.buf.signature_help()<CR>')
  --nnoremap('<leader>wa', '<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>')
  --nnoremap('<leader>wr', '<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  --nnoremap('<leader>wl', '<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  nnoremap('<leader>D', '<CMD>lua vim.lsp.buf.type_definition()<CR>')
  nnoremap('<leader>rn', '<CMD>lua vim.lsp.buf.rename()<CR>')
  nnoremap('<leader>ca', '<CMD>lua vim.lsp.buf.code_action()<CR>')
  nnoremap('gr', '<CMD>lua vim.lsp.buf.references()<CR>')
  nnoremap('<leader>ds', '<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  nnoremap('[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>')
  nnoremap(']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>')
  --nnoremap('<leader>q', '<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>')
  nnoremap('<leader>f', '<CMD>lua vim.lsp.buf.formatting()<CR>')
end

