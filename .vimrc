"---------------
" vim settings
"---------------

" Vimの無名レジスタ(0レジスタ)からクリップボードに
"command Pbcopy : let @*=@" "最後にyank or 削除した内容をクリップボードに入れる
"command Pbcopy0 : let @*=@0 "最後にyankした内容をクリップボードに入れる

" エンコ−ディングやら行数やらクリップボードやら
:set encoding=utf-8
:set fileencodings=ucs-bom,iso-2022-jp,cp932,euc-jp
:set fileformats=unix,dos,mac
:set fenc=utf-8
:set number
:syntax on

" Theme
syntax enable
set background=dark
" colorscheme solarized
" let g:solarized_termtrans=1
set t_Co=256

" 新しい行のインデントを現在の行と同じにする
set autoindent

" バックアップファイルのディレクトリを指定する
set backupdir=$HOME/.vim/backup

" クリップボードをWindowsと連携する
set clipboard=unnamed

" vi互換をオフる
set nocompatible

" スワップファイル用ディレクトリの指定
set directory=$HOME/.vim/backup

" タブの代わりに空白文字
set expandtab

" タブ幅の指定
set tabstop=4

" 変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

" インクリメンタルサーチを行う
set incsearch

" 行番号を表示する
set number

" 閉じカッコが入力された時、対応するカッコを強調する
set showmatch

" 新しい行を作った時に高度な自動インデントを行う
set smarttab

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" vimgrepやgrepした際に、cwindowしてしまう
autocmd QuickFixCmdPost *grep* cwindow

" エスケープシーケンスの表示 tab eol
set list
set listchars=tab:▸\ ,eol:↲

" 全角スペースの表示
function! ZenKakuSpace()
	highlight ZenKakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
	augroup ZenKakuSpace
		autocmd!
		"ZenKakuSpaceをカラーファイルでするなら、
		"次の行をコメントアウト
		autocmd ColorScheme       * call ZenKakuSpace()
		autocmd VimEnter,WinEnter * match ZenKakuSpace /  /
        augroup END
	call ZenKakuSpace()
endif

"--------------------------------------
" neobundle
set nocompatible                    "Be iMproved
filetype off                        "Required!

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on           "Required!

"Installation check.
if neobundle#exists_not_installed_bundles()
 echomsg 'Not installed bundles : '.
	\ string(neobundle#get_not_installed_bundle_names())
 echomsg 'Please execute ":NeoBundleInstall" command.'
 "finish
endif

"-----------------------------------------------
" render - :PrevimOpen
NeoBundle 'godlygeek/tabular'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'felixge/vim-nodejs-errorformat'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'


call neobundle#end()
NeoBundleCheck

au BufRead,BufNewFile *.md :set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:vim_markdown_folding_disabled=1

" ESCをC-jにバインディング
imap <c-j> <esc>

" PowerLine
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set showtabline=2
set noshowmode
