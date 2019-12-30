" be iMproved
set nocompatible
" Required by Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YouCompleteMe - Auto complete
Plugin 'Valloric/YouCompleteMe'
" NerdTree for file navigation & management
Plugin 'scrooloose/nerdtree'
" Nerd Git
Plugin 'Xuyuanp/nerdtree-git-plugin' 
" Typescript syntax
Plugin 'leafgarland/typescript-vim'
" Typescript Lintering
Plugin 'Qurami/tsuquyomi'
" JS and Typescript correct indentation
" Plugin 'jason0x43/vim-js-indent'
" Code theme
Plugin 'tomasiser/vim-code-dark'
" Git Diff Line indicators
Plugin 'airblade/vim-gitgutter'
" Full path fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'
" Function ctrlp finder
Plugin 'tacahiroy/ctrlp-funky'
" Git implementation for vim to make commits and inspections
Plugin 'tpope/vim-fugitive'
" Code formatting
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
" TagBar for function markings
Plugin 'majutsushi/tagbar'
" Javascript editing support
Plugin 'ternjs/tern_for_vim'
" Javascript indentation and improved highlighting
Plugin 'pangloss/vim-javascript'
" Comment lines with shortcut
Plugin 'scrooloose/nerdcommenter'
" VimTmuxNavigator #tmux #navigation #vim
Plugin 'christoomey/vim-tmux-navigator'
" VimGo #golang #go #tools
Plugin 'fatih/vim-go'
" GoCode #golang #go #autocompletion
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
" Vim Airline #powerline #line #horizontalline
Plugin 'vim-airline/vim-airline'

" All of the plugins must be hosted before this line
call vundle#end()
filetype plugin indent on

" Code formatting
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

