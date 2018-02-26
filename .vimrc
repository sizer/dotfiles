"dein.vimの設定"{{{
  if &compatible
    set nocompatible
  endif
  
  " plugin directory for dein
  let s:dein_dir = expand('~/.cache/dein')
  " actually dein
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  
  " if dein doesn't exist, clone it.
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  endif
  
  call dein#begin(expand('~/.cache/dein'))
  
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/vimshell')
  call dein#add('powerline/powerline')
  call dein#add('tpope/vim-fugitive')
  
  call dein#add('derekwyatt/vim-scala')
  call dein#add('pangloss/vim-javascript')
  call dein#add('posva/vim-vue')
  call dein#add('digitaltoad/vim-pug')
  call dein#add('mxw/vim-jsx')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('kchmck/vim-coffee-script')
  
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('scrooloose/nerdtree')
  
  call dein#add('airblade/vim-gitgutter')
  call dein#add('kien/rainbow_parentheses.vim')
  
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('mattn/emmet-vim')

  call dein#end()
  
  if dein#check_install()
    call dein#install()
  endif
  
  filetype plugin indent on
"}}}

"vimの設定"{{{
  syntax on
  set number
  set shiftwidth=2
  set hlsearch
  set smartcase
  set list
  set backspace=indent,eol,start
  " Tabキーで半角スペースを2個入力する
  set expandtab
  set smarttab
  set tabstop=2
  set shiftwidth=2
  " about StatusLine
  " ステータスラインの表示
  set statusline=%<     " 行が長すぎるときに切り詰める位置
  set statusline+=[%n]  " バッファ番号
  set statusline+=%m    " %m 修正フラグ
  set statusline+=%r    " %r 読み込み専用フラグ
  set statusline+=%h    " %h ヘルプバッファフラグ
  set statusline+=%w    " %w プレビューウィンドウフラグ
  set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
  set statusline+=%y    " バッファ内のファイルのタイプ
  set statusline+=\     " 空白スペース
  if winwidth(0) >= 130
    set statusline+=%F    " バッファ内のファイルのフルパス
  else
    set statusline+=%t    " ファイル名のみ
  endif
  set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
  set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%1l   " 何行目にカーソルがあるか
  set statusline+=/
  set statusline+=%L    " バッファ内の総行数
  set statusline+=,
  set statusline+=%c    " 何列目にカーソルがあるか
  set statusline+=%V    " 画面上の何列目にカーソルがあるか
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%P    " ファイル内の何％の位置にあるか
  " カッコの補完
  inoremap {<Enter> {}<Left><CR><ESC><S-o>
  inoremap [<Enter> []<Left><CR><ESC><S-o>
  inoremap (<Enter> ()<Left><CR><ESC><S-o>
  " カーソルを自動的に()の中へ
  imap {} {}<Left>
  imap [] []<Left>
  imap () ()<Left>
  imap "" ""<Left>
  imap '' ''<Left>
  imap <> <><Left>
  " 閉じタグの自動補完
  augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  augroup END
  " xキー削除がyankレジスタをうわがかないようにする
  noremap PP "0p
  noremap x "_x
  " 無限undo
  if has('persistent_undo')
    set undodir=~/.vim/undo
      set undofile
  endif
  " 前回編集位置の記憶
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""
"}}}

"ctagsの設定"{{{
  nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
  nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
  " 拡張子で読み込みタグ変更
  autocmd BufNewFile,BufRead *.scala set tags+=$HOME/scala.tags
"}}}

"neocompleteの設定"{{{
  "Note: This option must set it in .vimrc(_vimrc). NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  "Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  
  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
  
  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
  
  " Plugin key-mappings.
  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()
  
  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
  
  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1
  
  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
  
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  
  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  
  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}

"neosnippetの設定"{{{
  " Plugin key-mappings.
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  
  " SuperTab like snippets behavior.
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  
  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif
"}}}

"vim-indent-guidesの設定"{{{
  " Vim 起動時 vim-indent-guides を自動起動
  let g:indent_guides_enable_on_vim_startup=1
  " ガイドをスタートするインデントの量
  let g:indent_guides_start_level=6
  " 自動カラー無効
  let g:indent_guides_auto_colors=0
  colorscheme default
  " 奇数番目のインデントの色
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#444433 ctermbg=black
  " 偶数番目のインデントの色
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
  " ガイドの幅
  let g:indent_guides_guide_size = 1
  " ガイドをOFFにするファイルの設定
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', '*.yml']
"}}}

"NERDTreeの設定"{{{
  " 隠しファイルをデフォルトで表示させる
  let NERDTreeShowHidden = 1
  " ファイル名が指定されてVIMが起動した場合はNERDTreeを表示しない
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " ディレクトリ開閉ステータスアイコンを変更
  let g:NERDTreeDirArrows = 1
  let g:NERDTreeDirArrowExpandable = '+'
  let g:NERDTreeDirArrowCollapsible = '-'
"}}}

"rainbow parenthesesの設定"{{{
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
"}}}

"CoffeeScriptVimの設定"{{{
  " recognize coffee file type to vim.
  autocmd BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
  autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
  " auto compilie.
  autocmd BufWritePost *.coffee silent make! --output ~/.vim/coffee-script-vim/compiled
  autocmd QuickFixCmdPost * nested cwindow | redraw!
  
"}}}
"ctrlpの設定"{{{
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"}}}
"emmet-vimの設定"{{{
"}}}
