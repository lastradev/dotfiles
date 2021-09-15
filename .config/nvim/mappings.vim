let mapleader = " "

" File tree
nnoremap <leader>e :NvimTreeToggle<cr>

" Commenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"Fuzzy Search config
nnoremap <leader>ps :Files<CR>
nnoremap <leader>fs :Ag<CR>

" Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Line moving
" "  Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" " Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Useful for closing parenthesis
inoremap <C-l> <Right>

" Flutter remaps
nnoremap <leader>fe :FlutterEmulators<CR>
nnoremap <leader>fo :lua vim.lsp.buf.formatting()<cr>

" Undotree
nnoremap <leader>u :UndotreeShow<CR>

" Necessary for lsp to update diagnostics
inoremap <C-c> <esc>

" Test remaps
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Compe remaps
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" LSP SAGA remaps
" " LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" " code action
nnoremap <silent><leader>a :Lspsaga code_action<CR>
vnoremap <silent><leader>a :<C-U>Lspsaga range_code_action<CR>
" " show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>
" " scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" " scroll up hover doc
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" " show signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>
" " rename
nnoremap <leader>rn :Lspsaga rename<CR>
" " Go to definition
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
" " Preview definition
nnoremap <silent> gD :Lspsaga preview_definition<CR>
" " Show diagnostics
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" " Jump diagnostics
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

" Trouble remaps
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Delete comments with /
nnoremap <leader>dc :g/^\s*\//d<CR>

" Exit insert mode in terminal (useful for tests)
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" debugging
nnoremap <silent><leader>b :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <silent><leader>dr :lua require'dap'.continue()<cr>
nnoremap <silent><leader>do :lua require'dap'.step_over()<cr>
nnoremap <silent><leader>di :lua require'dap'.step_into()<cr>

" terminal
nnoremap <silent><leader>t :ToggleTerm()<cr>
