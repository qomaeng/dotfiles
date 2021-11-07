local plugin = 'nerdtree-git-plugin'

if packer_plugins[plugin] and packer_plugins[plugin].loaded then
  vim.cmd([[
    " There is a predefined map used nerdfonts, to enable it
    let g:NERDTreeGitStatusUseNerdFonts = 1

    let g:NERDTreeGitStatusIndicatorMapCustom = { 'Dirty': '✗' }
  ]])
end


