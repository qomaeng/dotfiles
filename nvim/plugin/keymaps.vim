scriptencoding utf-8

inoremap <silent> jk <ESC>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>e :e<CR>

nnoremap <silent> <leader>sv :vsplit<CR>
nnoremap <silent> <leader>sh :split<CR>
nnoremap <silent> <UP>       :resize +2<CR>
nnoremap <silent> <DOWN>     :resize -2<CR>
nnoremap <silent> <LEFT>     :vertical resize -2<CR>
nnoremap <silent> <RIGHT>    :vertical resize +2<CR>
nnoremap <silent> <leader>rr <C-w>r
nnoremap <silent> <leader>=  <C-w>=
nnoremap <silent> <leader>h  :wincmd h<CR>
nnoremap <silent> <leader>j  :wincmd j<CR>
nnoremap <silent> <leader>k  :wincmd k<CR>
nnoremap <silent> <leader>l  :wincmd l<CR>

nnoremap <silent> <leader>mb :make b<CR>
nnoremap <silent> <leader>mr :make r<CR>
nnoremap <silent> <leader>mt :make t<CR>

nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>

nnoremap <silent> <leader> tt :tabnew<CR>
nnoremap <silent> [t          :tabprev<CR>
nnoremap <silent> ]t          :tabnext<CR>

nnoremap <silent> <C-h> :noh<CR>
nnoremap <silent> <C-k> :m .-2<CR>==
nnoremap <silent> <C-j> :m .+1<CR>==
xnoremap <silent> <C-k> :m '<-2<CR>gv=gv
xnoremap <silent> <C-j> :m '>+1<CR>gv=gv

