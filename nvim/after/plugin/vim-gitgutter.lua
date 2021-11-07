local plugin = 'vim-gitgutter'

if packer_plugins[plugin] then
  vim.cmd([[
    nmap ghs <Plug>(GitGutterStageHunk)
    nmap ghu <Plug>(GitGutterUndoHunk)
    nmap ghp <Plug>(GitGutterPreviewHunk)
  ]])
end


