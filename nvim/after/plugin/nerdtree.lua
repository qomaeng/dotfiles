local plugin = 'nerdtree'

if packer_plugins[plugin] then
  vim.cmd([[
    " Mirror the NERDTree before showing it. This makes it the same on all tabs.
    nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeToggle<CR>
  ]])

  if packer_plugins[plugin].loaded then
    vim.cmd([[
      if not packer_plugins[plugin].loaded then
        return
      end

      augroup nerdtree_auto_mirror_each_tab
        au!
        " Open the existing NERDTree on each new tab.
        autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
      augroup END

      augroup nerdtree_auto_close_when_alone
        au!
        " Exit Vim if NERDTree is the only window remaining in the only tab.
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
        " Close the tab if NERDTree is the only window remaining in it.
        autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
      augroup END
    ]])
  end
end

