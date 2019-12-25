" INSTALLATION NOTES
  " For command.t to run you need to run following command in this dir:
  " ~/.vim/plugged/command-t/ruby/command-t/ext/command-t
  " make clean; ruby extconf.rb && make 
  " For youcompletme run this in directory
  "  ~/.vim/plugged/youcompletme/./install.py --clang-completer
  "  Run after :PlugInstall in vim and you should be ready to go.
  " For Ultisnip to work:
  " mkdir -p ~/.vim/ftdetect/
  " ln -s ~/.vim/plugged/ultisnips ~/.vim/ftdetect/
  " For persisten undo create empty undo directory:
  " mkdir ~/.vim/undo
" PLUGINS

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

 call plug#begin('~/.vim/plugged')

  " Fugtive
    Plug 'https://github.com/tpope/vim-fugitive.git'
    Plug 'https://github.com/tpope/vim-repeat.git'
    Plug 'https://github.com/tpope/vim-rhubarb.git' 
    Plug 'https://github.com/tpope/vim-unimpaired.git'
    Plug 'https://github.com/tpope/vim-surround.git'
    Plug 'https://github.com/tpope/vim-commentary.git'  
    Plug 'https://github.com/tpope/vim-vinegar.git'
    Plug 'https://github.com/tpope/vim-dispatch.git'
    Plug 'https://github.com/907th/vim-auto-save.git'
  " Git 
    Plug 'https://github.com/idanarye/vim-merginal.git'
    Plug 'https://github.com/mxw/vim-jsx.git'
  " Javascript
    " Plug 'benjie/local-npm-bin.vim'
    Plug 'https://github.com/pangloss/vim-javascript.git'
    Plug 'https://github.com/mxw/vim-jsx.git'
    Plug 'https://github.com/Valloric/MatchTagAlways.git'
  " Plug 'scrooloose/syntastic'
    Plug 'mtscout6/syntastic-local-eslint.vim'
    Plug 'https://github.com/justinmk/vim-dirvish.git'
    Plug 'ludovicchabant/vim-gutentags'

  " Django
    Plug 'python-mode/python-mode', { 'branch': 'develop' }
  " Tests 
    Plug 'https://github.com/junegunn/vader.vim.git'
    Plug 'janko-m/vim-test'
 
  " " File managers
    Plug 'https://github.com/junegunn/fzf.vim.git'
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'francoiscabrol/ranger.vim' 
    Plug 'rstacruz/sparkup', {'rtp': '.vim/'}
    Plug 'git://git.wincent.com/command-t.git' 
  
  " Tools
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'mhinz/vim-startify'
    " On-demand lazy load
    " Plug 'mtth/scratch.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'airblade/vim-gitgutter'
    " Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plug 'vim-airline/vim-airline'
    Plug 'https://github.com/Valloric/YouCompleteMe.git'
    " Plug 'https://github.com/mbbill/undotree'
    Plug 'christoomey/vim-system-copy'
    Plug 'christoomey/vim-quicklink'
    " Plug 'https://github.com/yuratomo/w3m.vim.git'
    " Plug 'https://github.com/mattn/webapi-vim'
  
  " Windows management
    " Upgrade to neovim is needed:
    " Plug 'https://github.com/fabi1cazenave/suckless.vim.git' 
  
  " Documents
    " Plug 'https://github.com/suan/vim-instant-markdown.git'
    Plug 'xuhdev/vim-latex-live-preview'
  
  " Colors/Appearance/Indentation
    Plug 'https://github.com/dylanaraps/wal.vim.git'
    Plug 'https://github.com/ap/vim-css-color.git' 
    Plug 'https://github.com/Glench/Vim-Jinja2-Syntax.git'
    Plug 'https://github.com/lepture/vim-jinja'
    Plug 'flazz/vim-colorschemes'
    Plug 'sainnhe/vim-color-forest-night'
  
  " Snipamte/Emmet
    Plug 'https://github.com/SirVer/ultisnips.git'
    Plug 'https://github.com/honza/vim-snippets'
    Plug 'https://github.com/mattn/emmet-vim.git'

  call plug#end()

" CUSTOM FUNCTIONS

  fun! SpawnTerminal()
    :silent !{ urxvt -cd "%:p:h" & }
  endf

  fun! LiveServer()
    :silent !{ urxvt -cd "%:p:h" -e live-server & }
  endf

  fun! ReactServer()
    :silent !{ urxvt -cd "%:p:h" -e yarn develop & }
  endf


  fun! Browseoldfiles()
  vnew +setl\ buftype=nofile | 0put =v:oldfiles | nnoremap <buffer> <cr> :e <c-r>=getline('.')<cr><cr> 
  normal gg
  setlocal nobuflisted 
  wincmd L 
  endf
  
" BINDINGS
  " Spawn terminal
    let g:which_key_map =  {}

    let g:which_key_map.k= {
     \ 'name' : '+konsole' ,
     \ 'k' : [':call SpawnTerminal()'            , 'Open new terminal here']                           ,
     \ 'l' : [':call LiveServer() '              , 'Run live-server']                                  ,
     \ 'y' : [':call ReactServer()'              , 'Run yarn server']                                  ,
     \ }

    
    " nnoremap <leader>kt :call SpawnTerminal() <cr>
    " nnoremap <leader>kl :call LiveServer() <cr>
    " nnoremap <leader>kr :call ReactServer() <cr>

    let mapleader = "\<space>"
  " Themes
    nnoremap <leader>cl :colorscheme lightning <cr>
    nnoremap <leader>cw :colorscheme wal <cr>
    nnoremap <leader>cd :colorscheme 1989 <cr>
  " Sessions
    nnoremap <leader>ss :source session.vim <cr> <bar> :source ~/.vimrc<cr>
    nnoremap <leader>sm :mksession! session.vim<cr>
  " Windows  
    nnoremap <leader>w0 :vertical resize +20<cr>
    nnoremap <leader>w9 :vertical resize -20<cr>
    nnoremap <leader>wq :wq <cr>
  " File mappings 
    map <leader>fn  :NERDTreeToggle<cr>
    map <leader>fr  :Ranger<cr>
    map <leader>ff  :CommandT<cr>

    nnoremap <leader>fo :call Browseoldfiles() <cr>
    nnoremap <leader>fw :w <cr>
    nnoremap <leader>fW :w! <cr>
    nnoremap <leader>fWa :wa! <cr>
    nnoremap <leader>fq :q <cr> 
    nnoremap <leader>fQ :q! <cr> 
    nnoremap <leader>vq :qa! <cr> 
    nnoremap <leader>vw :wa! <cr> 
    nnoremap <leader>fb :0,$d <bar> 0 r !js-beautify -s 2 -m 1 %
    nnoremap <leader>fp :PymodeLintAuto<cr>
    nnoremap <leader>fn :vnew <bar> wincmd L <cr>
    nnoremap <leader>fE :new <cr>
    
    nnoremap <leader>fv :e ~/.vim/.vimrc <cr>
" PLUGGINS BINDING:
  " Fuzzy

    " Command for git grep
    " - fzf#vim#grep(command, with_column, [options], [fullscreen])
    
    command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)

    " Override Colors command. You can safely do this in your .vimrc as fzf.vim
    " will not override existing commands.
    command! -bang Colors
      \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

    " Likewise, Files command with preview window
    command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

  " Which key
    " Dont setup this parameter bellow 500 because 
    " shourtchats like 'gcap' will not work correctly
    " or cP for copy to system clipboard 
      set timeoutlen=500

      function UnmapPluginsBindings()
        if ! empty(maparg('<leader>b', 'n')) 
          unmap <leader>b
          endif
        if ! empty(maparg('<leader>d', 'n')) 
           unmap <leader>d
          endif
        if ! empty(maparg('<leader>t', 'n')) 
          unmap <leader>t
          endif
      endf 

    let g:which_key_map.f = { 'name' : '+file' }
    let g:which_key_map.f.f = { 'name' : 'file paths' }
    let g:which_key_map.g = { 'name' : '+git' }
    let g:which_key_map.w = { 'name' : 'window' }
    let g:which_key_map.s = { 'name' : 'session' }
    let g:which_key_map.y = { 'name' : 'ycm' }

    let g:which_key_map.h= {
     \ 'name' : '+hunk' ,
     \ 'f' : ['GitGutterFold'                   , 'Folds code that was not changed']         ,
     \ 'h' : ['GitGutterLineHighlightsToggle'   , 'Line Highlits']         ,
     \ '.' : ['GitGutterNextHunk'               , 'Next Hunk']             ,
     \ ',' : ['GitGutterPrevHunk'               , 'Prev Hunk']             ,
     \ }

    let g:which_key_map.b= {
    \ 'name' : '+buffer' ,
    \ 'b' : ['<Plug>(CommandTMRU)'        , 'Command-t' ]        ,
    \ '1' : ['b1'        , 'buffer 1']        ,
    \ '2' : ['b2'        , 'buffer 2']        ,
    \ 'd' : ['bd'        , 'delete-buffer']   ,
    \ 'f' : ['bfirst'    , 'first-buffer']    ,
    \ 'h' : ['Startify'  , 'home-buffer']     ,
    \ 'l' : ['blast'     , 'last-buffer']     ,
    \ 'n' : ['bnext'     , 'next-buffer']     ,
    \ 'p' : ['bprevious' , 'previous-buffer'] ,
    \ }
    
    let g:which_key_map.t= {
    \ 'name' : '+tests' ,
    \ 'c' : ['TestNearest'      , '(Cursor) In a test file runs the test nearest to the cursor']     ,
    \ 'f' : ['TestFile'         , '(File) In a test file runs all tests in the current file']         ,
    \ 'a' : ['TestSuite'        , '(All) Runs the whole test suite']                                  ,
    \ 'l' : ['TestLast'         , '(Last) Runs the last test']                                        ,
    \ 'v' : ['TestVisit'        , '(Visits) the test file from which you last run your tests']        ,
    \ }

    nnoremap <silent> <leader> :call UnmapPluginsBindings() <bar> :WhichKey '<Space>'<CR>
    call which_key#register('<Space>', "g:which_key_map")

    " nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
    " vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
  " Command-t
    " nmap <silent> <Leader>t <Plug>(CommandT)
    " nmap <silent> <Leader>b <Plug>(CommandTBuffer)
    " nmap <silent> <Leader>j <Plug>(CommandTJump)
    "
    
  " Git mappings
  "
    let g:which_key_map.g= {
    \ 'name' : '+git'        ,     
    \ 'm' : [':MerginalToggle'  , 'Branch manager']                                                 ,
    \ 'o' : [':Gbrowse'         , 'Open current file in github']                                    , 
    \ 's' : [':Gstatus'         , 'Open current file in github']                                    , 
    \ 'i' : [':e .gitignore'   , 'Open .gitignore file in current repo']                           ,
    \ 'A' : [':Git add .'       , 'Stage all files']                                                ,
    \ 'a' : [':Git add %'       , 'Stage current file to commit']                                   ,
    \ 'c' : [':Gcommit -m ""'   , 'Make a commit']                                                  ,
    \ 'C' : [':Git add .<cr><bar>:Gcommit -m ""' , 'Stage all files, and make commit']                 ,
    \ 'r' : [':Gread'           , 'Replace current buffer with last commited version of file. Press "u" to undo']     ,
    \ 'R' : [':Git reset -- %'  , 'Reset current file to previous version']                        ,
    \ 'RR' : [':Git revert HEAD~1..HEAD'  , 'Reset current repo to previous version']              ,
    \ 'l' : [':Git log --oneline'  , 'Show commit log']                                             ,
    \ 'p' : [':Gpush'  , 'Make a push']                                                             ,
    \ 'd' : [':Gdiff'  , 'Check difference with last commit']                                            ,
    \ }

    " \ 'x' : ['!svn ls'         , '[svn] check link from github' ]                                  ,
    " \ 'X' : ['!svn export'     , '[svn] download file from github link']                           ,
    
    nnoremap <leader>gx :!svn ls 
    nnoremap <leader>gX :!svn export 

    " nnoremap <leader>gm :MerginalToggle<CR>
    " nnoremap <leader>go :Gbrowse<CR>
    " nnoremap <leader>gi :e .gitignore<CR>
    " nnoremap <leader>gS :Git add .<cr><bar>:Gcommit -m ""
    " nnoremap <leader>ga :Git add %<CR><CR>
    " nnoremap <leader>gA :Git add .<CR><CR>
    " " Reset current file to the moment from last commit
    " nnoremap <leader>gr :Gread<CR><CR>
    " nnoremap <leader>gR :Git reset -- % <CR><CR>
    " " Revert to previous commit 
    " nnoremap <leader>gRR :Git revert HEAD~1..HEAD
    " nnoremap <leader>gb :Gblame<CR>
    " nnoremap <leader>gs :Gstatus<CR> <bar> :wincmd L <cr>
    " nnoremap <leader>gd :Gdiff<CR>
    " nnoremap <leader>g[ :diffget //2<CR>
    " nnoremap <leader>g] :diffget //3<CR>
    " nnoremap <leader>gL :Glog<CR>
    " nnoremap <leader>gl :Git log --oneline<CR>
    " nnoremap <leader>gc :Gcommit -m ""
    " nnoremap <leader>gp :Gpush<CR>
    " nnoremap <leader>ge :Gedit<CR><CR>

  " Ycm	
    nnoremap <leader>yi :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>yh :YcmCompleter GetDoc <cr>
  " Ultisnips
    let g:UltiSnipsExpandTrigger="<c-space>"
    let g:UltiSnipsJumpForwardTrigger="<c-l>"
    let g:UltiSnipsJumpBackwardTrigger="<c-h>"

  " Undotree
    nnoremap <leader>u :UndotreeToggle<cr>
"PLUGGINS SETTINGS
  " Autosave
    " let g:auto_save_events = ["InsertLeave", "TextChanged"]
  
  " Vim-test 
    " make test commands execute using dispatch.vim
    let test#strategy = "dispatch" 
  " NerdTree
    let NERDTreeShowHidden=1
    let NERDTreeShowBookmarks=1
    map <C-n> :NERDTreeToggle<CR>
    " autocmd vimenter * NERDTreeToggle
    

  " Ultisnips
    set runtimepath+=~/.vim/plugged/ultisnips/
    let g:UltiSnipsEditSplit="vertical"
    " let g:UltiSnipsSnippetsDir =  '~/vim/plugged/vim-snippets/snippets'
    let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/snippets']
  " Command-t
    let g:CommandTCancelMap='<Esc>'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.ds_store,*/.git/*,*.pyc,/__pycache__,*/venv/*
  " Ranger
    " Disable default key
    let g:ranger_map_keys = 0
  " Fugitive
    " clean buffers from fugitive
    autocmd bufreadpost fugitive://* set bufhidden=delete
    set diffopt+=vertical
  " Gutter 
    set updatetime=100
    highlight link GitGutterChangeLine DiffText
  " Powerline
    set laststatus=2
  " Python mode
    " Autopep on save
    " au BufWriteCmd *.py write || :PymodeLintAuto
    " au BufWriteCmd *.py write || :PymodeLint
    let g:pymode_breakpoint = 0
    let g:pymode_breakpoint_bind = '<leader>pb'
    let g:pymode_lint = 1
    let g:pymode_lint_on_fly = 1
    let g:pymode_lint_ignore = ["E501"]
    " let g:pymode_virtualenv = 1
    let g:pymode_rope = 0
    let g:pymode_rope_completion_bind = '<c-space>'
  " You complete me
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_auto_trigger = 1
    " let g:ycm_key_invoke_completion = '<C-Space>'
  " Javascript plugings
  "
  " let g:js_file_import_prompt_if_no_tag = 0

  let g:syntastic_javascript_checkers = ['eslint']
  let g:mta_use_matchparen_group = 1
  let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'javascript.jsx' : 1,
      \}


" VIM SETTINGS
" Set working directory to current file
    " set autochdir
    " let &path .= "," . system("git rev-parse --show-toplevel | tr -d '\\n'")
    " autocmd BufEnter * silent! lcd &path
    

       fun! OpenGitDir()
           """ Set working directory to close .git 
           """ https://stackoverflow.com/questions/4596932/vim-cd-to-path-stored-in-variable
           cd %:p:h 
           let gitdir = system("git rev-parse --show-toplevel | tr -d '\\n'")  
           execute 'cd'. fnameescape(gitdir)
       endf 

    " autocmd BufEnter * call OpenGitDir()

    
    set mouse=a

  " Custom movements for copy and pastin directly in to {[("'
    " ' one " double
    nnoremap pO ?'<cr>di'"0P <cr>
    nnoremap po /'<cr>di'"0P <cr>
    nnoremap pD ?"<cr>di""0P <cr>
    nnoremap pd /"<cr>di""0P <cr>
    " ( round, { curly, [ square, 
    nnoremap pr /(<cr> :silent! norm! F)di(f(di("0P <cr>
    nnoremap pR ?)<cr> :silent! norm! F)di(f(di("0P <cr>
    nnoremap ps /[<cr> :silent! norm! F]di[f[di["0P <cr>
    nnoremap pS ?]<cr> :silent! norm! F]di[f[di["0P <cr>
    nnoremap pc /}<cr> :silent! norm! F}di{f{di{"0P <cr>
    nnoremap pc ?[<cr> :silent! norm! F}di{f{di{"0P <cr>
    nnoremap p) :silent! norm! F)di(f(di("0P <cr>
    nnoremap p( :silent! norm! F)di(f(di("0P <cr>
    nnoremap p] :silent! norm! F]di[f[di["0P <cr>
    nnoremap p[ :silent! norm! F]di[f[di["0P <cr>
    nnoremap p} :silent! norm! F}di{f{di{"0P <cr>
    nnoremap p} :silent! norm! F}di{f{di{"0P <cr>

    nnoremap dD ^d$ 
    nnoremap yY ^y$  

    let g:startify_bookmarks = [
            \ '/home/migacz/Coding/www/',
            \ '/www/gatsby-starter-lumen/',
            \ ]

" Tabs
    nnoremap <leader>tN :tabnew <cr>
    " nnoremap <BS> i<BS><Esc>`^
  " Move throught jumps 
    " nnoremap <C-i> 
    " nnoremap <C-o>
    
    "Sometimes tab is activating combination above so it need to be remaped.
    " nnoremap <tab> l 
    
  " Show what keys are pressed
    set showcmd
  " Tabstops
    set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
  " Folds
  " Search
    " When selecting a parenthesis it will highlight the one matching:
    set showmatch
    set incsearch
    set ignorecase
    set nohls
  " When opening new files don't close them but keep them in buffers
    set hidden
  " Reloading vim
    autocmd BufWrite ~/.vimrc nested :source $HOME/.vimrc
    noremap <leader>rv :source $HOME/.vimrc <cr>

    augroup myvimrc
        au!
        au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    augroup END

  " Autocompletion
    set wildmenu	
  " Spell checking
    autocmd bufread,bufnewfile *.md setlocal spell
    autocmd bufread,bufnewfile *.tmp setlocal spell
    autocmd filetype gitcommit setlocal spell
  " Syntax and lines
    set nowrap
    set relativenumber " show relative number, instead of normal line numbers
    set number " line number
  " Colors/Appearance 
    syntax on
    " indentation colors
    set ts=4 sw=4 et
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    " set background=light
    let g:airline_theme = 'forest_night'
    colorscheme  1989 "forest-night "lightning
    " pop up menu colors
    highlight Pmenu ctermbg=gray 
    highlight statusline ctermfg=yellow 

  " Persistent undo
  " be sure to create the 'undo' directory first
    if has('persistent_undo')    "check if your vim version supports it
    set undofile                 "turn on the feature  
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
    endif     
  " Windows
  " o
    let g:suckless_tabline = 0
    let g:suckless_guitablabel = 0

  "Synchronise Grep with nerd tree
  
    map <F1> :QFix<cr>
    map <F5> :execute "vimgrep /" . expand("<cword>") . "/j **/*.js" <Bar> cw
    " map <F5> :execute "GGrep " . @" <cr>
    
   "Toggle qfix
    command -bang -nargs=? QFix call QFixToggle(<bang>0)
    function! QFixToggle(forced)
      if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
      else
        bot copen
        let g:qfix_win = bufnr("$")
      endif
    endfunction

  function! UpdateNerdTreeDir()

    if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
        exe "normal! \<c-w>\<c-w>"
    endif

    if exists("g:NERDTree") && g:NERDTree.IsOpen() 
        exec ":NERDTreeFind" 
    endif 
  endfunction

    fun! NerdSyncNext() 
        :cnext
        :call UpdateNerdTreeDir()
        if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
            exe "normal! \<c-w>\<c-w>"
        endif

    endf

    fun! NerdSyncPrev() 
        :cprev
        :call UpdateNerdTreeDir()
        if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
            exe "normal! \<c-w>\<c-w>"
        endif
    endf

    map <leader>l :call NerdSyncNext() <cr>
    map <leader>h :call NerdSyncPrev() <cr>
    map <Right> :cnext <cr>
    map <Left> :cprev <cr>

    set splitbelow
    set splitright

    " Help window on right
    autocmd FileType help wincmd L
    autocmd FileType snippets wincmd L
    " Focus window
    nnoremap <C-l> <C-W>l<C-W>
    nnoremap <C-h> <C-W>h<C-W>
    nnoremap <C-j> <C-W>j<C-W>
    nnoremap <C-k> <C-W>k<C-W>
