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

augroup nerdtree_buffer_has_to_be_open_at_another_window
  au!
  " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup END

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeToggle<CR>

