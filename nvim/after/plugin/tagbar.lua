local plugin = 'tagbar'

if packer_plugins[plugin] then
  vim.cmd([[nnoremap <C-t> :TagbarToggle<CR>]])
end

