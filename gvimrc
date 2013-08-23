if has("gui_macvim")

  let g:nerdtree_tabs_open_on_gui_startup=0
  let g:keymap=0

  " disable command p(Print)
  macmenu &File.Print key=<nop>

  " help menu, search deleting menus
  unmenu Edit.Keymap
  " macmenu &Edit.Keymap =<nop>
  " amenu disable &Edit.Keymap.*

  " map command+p to CtrlP
  map <D-p> :CtrlP<CR>

  " hide toolbar default, shortcut is :set go-=T or :set go+=T
  set guioptions-=T

  " hide left scrollbar but show right scrollbar default, shortcut is :set go-=r, or :set go+=r
  set guioptions-=L
  set guioptions+=R

  set guifont=Monaco:h12    " Font size
  set lines=60 columns=200  " UI size

  set bg=dark
  if &background == "dark"
      hi normal guibg=black
      set transparency=8
  endif

  " make ctrl + a,e (readline mode) behaves like command + left/right arrows
  cmap <c-a> <Home>
  cmap <c-e> <End>

	" shift indents with Command+[ or ], like sublime
	map <D-]> >gv
	nmap <D-]> >>
	imap <D-]> <Esc><D-]>
	map <D-[> <gv
	nmap <D-[> <<
	imap <D-[> <Esc><D-[>

	" use Command+/ to toggle comments
	map <D-/> <plug>NERDCommenterToggle
	imap <D-/> <Esc><plug>NERDCommenterTogglea

  " Tab switch like iterm
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt
  map <D-0> :tablast<CR>

  color tir_black

endif
