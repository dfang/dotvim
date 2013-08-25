set nocompatible               " Be iMproved

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Enable filetype plugins
filetype plugin indent on
syntax enable

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }

NeoBundle 'Shougo/neocomplete.vim' "{{{
  " Disable AutoComplPop
  let g:acp_enableAtStartup=0
  " Use neocomplete
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3

  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  " Define dictionary
  " Define keyword
  if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/unite.vim'
"{{{
  NeoBundle 'Shougo/unite-outline'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'jistr/vim-nerdtree-tabs'
  let g:NERDTreeMinimalUI=1
  let NERDTreeShowBookmarks=1
  let NERDTreeShowHidden=1
  let g:nerdtree_tabs_open_on_gui_startup=0
  let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.jpg', '\.png', '\.gif', '\.DS_Store', '\.ttf', '\.svg', '\.eot', '\.woff']
  NeoBundle 'ack.vim'
  let g:ackprg = 'ag --nogroup --nocolor --column'
"}}}

" Core Plugins
  NeoBundle 'Shougo/vimshell.vim'
  NeoBundle 'Shougo/context_filetype.vim'
  NeoBundle 'tpope/vim-sensible'
  NeoBundle 'tpope/vim-abolish'
  NeoBundle 'tpope/vim-dispatch'
  NeoBundle 'tpope/vim-fugitive' "{{{
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
    nnoremap <silent> <leader>gg :GitGutterToggle<CR>
  "}}}
  NeoBundle 'tpope/vim-repeat'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-commentary'
  NeoBundle 'Lokaltog/vim-easymotion'

  NeoBundle 'ervandew/supertab'
  NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'}} "{{{
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  "}}}
  NeoBundle 'bling/vim-airline'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'kana/vim-smartinput'
  NeoBundle 'matchit.zip'

" Language Specific Plugins
  NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
  NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
  NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
  NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
  NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
  NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
  NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
  NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
  NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
  NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache']}} "{{{
    function! s:zen_html_tab()
      let line = getline('.')
      if match(line, '<.*>') < 0
        return "\<c-y>,"
      endif
      return "\<c-y>n"
    endfunction
    autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><tab> <c-y>,
    autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()
  "}}}

  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'tpope/vim-haml'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'tpope/vim-rake'
  NeoBundle 'tpope/vim-bundler'
  NeoBundle 'thoughtbot/vim-rspec'
  NeoBundle 'tpope/vim-markdown'

  NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}} "{{{ vim-javascript settings
    let javascript_enable_domhtmlcss = 1
    let javascript_ignore_javaScriptdoc = 1
    let b:javascript_fold = 1
    let g:javascript_conceal = 1
  "}}}
  NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}} "{{{
    nnoremap <leader>fjs call JsBeautify()
  "}}}
  NeoBundleLazy 'leafgarland/typescript-vim', {'autoload':{'filetypes':['typescript']}}
  NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
  NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
  NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
  NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}

  NeoBundle 'vim-scripts/eruby.vim'
  NeoBundle 'vim-scripts/nginx.vim'
  NeoBundle 'vim-scripts/rspec.vim' " Syntax highlighting

" Colors
  NeoBundle 'jnurmine/Zenburn'
  NeoBundle 'jpo/vim-railscasts-theme'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'tomasr/molokai'
  NeoBundle 'Lokaltog/vim-distinguished'
  NeoBundle 'chriskempson/base16-vim'
  NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
  NeoBundle 'rainux/vim-desert-warm-256'
  NeoBundle 'vim-scripts/wombat256.vim'
  NeoBundle 'trapd00r/neverland-vim-theme'
  NeoBundle 'croaky/vim-colors-github'
  NeoBundle 'vim-scripts/tir_black'
  NeoBundle 'tpope/vim-vividchalk'
  NeoBundle 'nanotech/jellybeans.vim'


" Trying this
  " NeoBundle 'vim-scripts/vim-colorscheme-switcher'
  " NeoBundle 'zeekay/vim-color-switch'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'ujihisa/unite-font'
  NeoBundle 'itspriddle/vim-jquery'
  NeoBundle 'goldfeld/vim-seek'
  NeoBundle 'kana/vim-textobj-user'
  NeoBundle 'nelstrom/vim-textobj-rubyblock'
  NeoBundle 'junegunn/vim-easy-align'
  NeoBundle 'bling/vim-bufferline'
  " NeoBundle 'vim-scripts/CmdlineComplete'
  NeoBundle 't9md/vim-chef'

" Installation check.
NeoBundleCheck

if filereadable(expand("~/.vimrc.default"))
  source ~/.vimrc.default
end

""{{{ Unite Settings
  let g:unite_source_file_rec_ignore_pattern=
  \'\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|dll\|ba\?k\|sw[po]\|tmp\|jpg\|jpeg\|png\|gif\|ico\|ttf\|svg\|eot\|woff\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|node_modules'

  " Yank history like yankring/yankstack
  let g:unite_source_history_yank_enable = 1
  nnoremap <space>y :Unite history/yank<cr>

  " Content seach like ack.vim/ag.vim
  nnoremap <space>/ :Unite grep:.<cr>

  " Buffer switching like lustyJuggler
  nnoremap <space>s :Unite -quick-match buffer<cr>

  " Custom settings for unite buffer
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    let g:unite_enable_start_insert=1

    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)

    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    nmap <buffer> <ESC>   <Plug>(unite_exit)

    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)

    call unite#custom#source('file_rec/async', 'ignore_pattern', g:unite_source_file_rec_ignore_pattern) " we don't edit these kinds of files in vim
    call unite#custom#source('grep', 'ignore_pattern', g:unite_source_file_rec_ignore_pattern)
    call unite#filters#sorter_default#use(['sorter_rank'])
    let g:unite_source_rec_max_cache_files = 5000
  endfunction

  " Use ag for search
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
  endif

  " https://github.com/Shougo/unite.vim/blob/master/doc/unite.txt
  " File searching like ctrlp.vim(userful parameters: -start-insert -auto-preview)
  noremap <c-p> :Unite -start-insert file_rec/async<cr>
""}}}

""{{{ NeoSnippet Settings
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
""}}}


"{{{ Unite custom menu
  " let g:unite_source_menu_menus = {}
  " let g:unite_source_menu_menus.test = {
  "       \     'description' : 'Test menu',
  "       \ }
  " let g:unite_source_menu_menus.test.candidates = {
  "       \   'ghci'      : 'VimShellInteractive ghci',
  "       \ }
  " function g:unite_source_menu_menus.test.map(key, value)
  "   return {
  "       \       'word' : a:key, 'kind' : 'command',
  "       \       'action__command' : a:value,
  "       \     }
  " endfunction
"}}}

" Vim for Rspec
  " map <Leader>t :call RunCurrentSpecFile()<CR>
  " map <Leader>s :call RunNearestSpec()<CR>
  " map <Leader>l :call RunLastSpec()<CR>
  " map <Leader>a :call RunAllSpecs()

vnoremap <silent> <Enter> :EasyAlign<cr>
" command! EditVim :NERDTree ~/.vim<cr>



"air themes are automatically selected based on the matching colorscheme. some
"airline theme may work not well with your current theme, so use this to override it(not automatically seleected)
"options can be found in AirLineTheme command or airline themes folder
let g:airline_theme="simple"
colors molokai
