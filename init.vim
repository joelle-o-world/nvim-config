call plug#begin(stdpath('data') . '/plugged')


"Editor config
Plug 'editorconfig/editorconfig-vim'

"Typescript / JavaScript
"Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
"Plug 'Quramy/tsuquyomi'
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim'
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plug 'maksimr/vim-jsbeautify'
"Plug 'jparise/vim-graphql'

" Stylesheets
Plug 'gko/vim-coloresque'

"Git plugins
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Auto commenter
Plug 'preservim/nerdcommenter'

"File Tree
"Plug 'preservim/nerdtree'

"Editing mustache templates
Plug 'mustache/vim-mustache-handlebars'

"Bracketting/quoting
Plug 'tpope/vim-surround'

"Graphviz plugin
Plug 'liuchengxu/graphviz.vim'

"emoji
Plug 'kyuhi/vim-emoji-complete'
imap <C-j> <Plug>(emoji-start-complete)

"Themes:
Plug 'sainnhe/sonokai'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'arzg/vim-corvine'
Plug 'reedes/vim-colors-pencil'
Plug 'wdhg/dragon-energy'
Plug 'flrnd/plastic.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'nightsense/strawberry'
" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'espresso'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

"Plug 'luffah/vim-accessibility'

"Fuzzy finder:
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
"Plug 'nvim-telescope/telescope.nvim'

"Note Taking
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'freitass/todo.txt-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"Vim Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" Java
"How is t
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
"Glaive codefmt plugin[mappings]
"Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

" Jira
"Plug 'paulkass/jira-vim', { 'do': 'pip install -r requirements.txt' }
Plug 'mnpk/vim-jira-complete'
let b:jiracomplete_url = 'https://zephr.atlassian.net/'
let b:jiracomplete_username = 'joelle.plowright@zephr.com'
"let b:jiracomplete_password = 'your_jira_password'  " optional
imap <silent> <unique> <leader>j <Plug>JiraComplete

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_section_b = ""

"Java
"call glaive#Install()
"Glaive codefmt google_java_executable="java -jar /Users/joelle/lib/google-java-format-1.11.0-all-deps.jar"


" Configure Telescope

" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"Prettier
vmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
:au BufWrite *.ts Prettier
:au BufWrite *.tsx Prettier
:au BufWrite *.json Prettier

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>



if strftime("%H") < 20 && strftime("%H") > 6
  colorscheme strawberry-light
else
  :colo strawberry-dark
endif

":colo dracula
":colo pencil
"set background=light

" Key mappings:
:let maplocalleader = "'"
:map <Leader>, :vs! ~/.config/nvim/init.vim<CR>
:map <Leader>j :m+1<CR>
:map <Leader>k :m-2<CR>
nmap <leader>t :NERDTreeToggle<cr>

nmap <C-ScrollWheelUp> <C-x>
nmap <C-ScrollWheelDown> <C-a>

:nmap <Leader>p :CtrlP

set mouse=a

" Adding new lines without leaving normal mode
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Disable Arrow keys in Normal mode
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

"map <Leader>t :exe 'e ~/notes/'.strftime("%F").'.md'<CR>
map <Leader>l :e ~/notes<cR>
"map <Leader>@ :e ~/notes/<cword>.md<CR>
map <Leader>T :e ~/Documents/vimwiki/Tasks.md<CR>

"Calendar shortcut
"map <Leader>c :Calendar<CR>

" vimwiki config
"function! s:in_diary()
  "let current_file = vimwiki#u#path_norm(expand("%:p"))
  "let diary_path = vimwiki#u#path_norm(VimwikiGet('path').VimwikiGet('diary_rel_path'))
  "return current_file =~# '^'.vimwiki#u#escape(diary_path)
"endfunction
au BufRead,BufNewFile *.wiki setlocal textwidth=80
"au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.wiki setlocal spell spelllang=en
au BufRead,BufNewFile *.md setlocal spell spelllang=en
autocmd BufNewFile *.wiki :r! echo = %:t:r =
autocmd BufNewFile *.wiki :norm kddo
autocmd BufNewFile *.md :r! echo "\#" %:t:r
autocmd BufNewFile *.md :norm kddo
"NOTE: this line is fucking with the yank function
au BufNewFile ~/Documents/vimwiki/????-??-??.md :r ~/diary-template.md
au BufWrite ~/Documents/vimwiki/????-??-??.wiki :!node ~/programming/plaintext-calendar/js/cli.js %
au BufRead,BufNewFile *.wiki map <Leader>n :put =strftime('@%H:%M')

nmap git :Git
nmap gulp :!gulp
nmap make :!make

"Auto commit vimwiki
autocmd BufWrite ~/Documents/vimwiki/*.md call AutoCommitVimwikiChanges()
function AutoCommitVimwikiChanges()
  "TODO Debug this line
  Gw
  :silent !(cd ~/Documents/vimwiki && git commit -m "auto commit: $(git status --short | grep '^[MARCD]')")
endfunction

"Auto commit vim config changes
autocmd BufWrite ~/.config/nvim/** call AutoCommitVimrcChanges()
function AutoCommitVimrcChanges()
  "TODO Debug this line
  Gw
  :silent !(cd ~/.config/nvim && git commit -m "auto commit: $(git status --short | grep '^[MARCD]')" && git push)
endfunction



map <Leader>w1 :tabnew<cr>:VimwikiMakeTomorrowDiaryNote<cr>:vs<cr>:e ~/Documents/vimwiki/Tasks.md<CR>:rightb vs<cr>:VimwikiMakeDiaryNote<cr>

"Jump to wiki page for current directory
map <Leader>WW :execute "e ~/Documents/vimwiki/" fnamemodify(getcwd(), ':t') . ".wiki"<CR>


" Vimwiki location
let g:vimwiki_list= [ {'path': '~/Documents/vimwiki', 'diary_frequency': 'weekly', 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path': ''}, { 'path': '~/vimwiki' } ]
let g:vimwiki_key_mappings = { 'table_mappings': 0 }
"let g:vimwiki_list = [{'path': '~/vimwiki/',
                      "\ 'syntax': 'markdown', 'ext': '.md'}]

set nu
syntax enable
set nocompatible
filetype plugin on
"let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

set omnifunc=syntaxcomplete#Complete
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|(dist\\\/.+)\|(build\\\/.+)'
nmap π :CtrlP<CR>


nmap § :Goyo<cr>

nmap <leader>? o<esc>!!~/code/local-zephr-state.sh<cr>

map g<space> :exec "!open \"http://google.com/search?q=".expand("<cword>")."\""<cr>

nmap yp :let @" = expand("%:p")<cr>: let @+ = expand("%:p")<cr>
nmap yl :let @" = join([expand('%:p'),  line(".")], ':')<cr>:let @+ = join([expand('%:p'),  line(".")], ':')<cr>


" Use real tab for make files
au BufRead,BufNewFile Makefile,makefile setlocal noexpandtab


" Wrapping:
set linebreak
set breakindent

" Turn off highlighting for search:
"set nohlsearch


"Open file tree at login
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Close nvim is only window left is a nerd tree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


nnoremap Q <Nop>
nnoremap <up> <Nop>
nnoremap <down> <Nop>
nnoremap <left> <Nop>
nnoremap <right> <Nop>



"jsonc comments
autocmd FileType json syntax match Comment +\/\/.\+$+




                      "~-.
          ",,,;            ~-.~-.~-
         "(.../           ~-.~-.~-.~-.~-.
         "} o~`,         ~-.~-.~-.~-.~-.~-.
         "(/    \      ~-.~-.~-.~-.~-.~-.~-.
          ";    \    ~-.~-.~-.~-.~-.~-.~-.
         ";     {_.~-.~-.~-.~-.~-.~-.~
        ";:  .-~`    ~-.~-.~-.~-.~-.
       ";.: :'    ._   ~-.~-.~-.~-.~-
        ";::`-.    '-._  ~-.~-.~-.~-
         ";::. `-.    '-,~-.~-.~-.
          "';::::.`''-.-'
            "';::;;:,:'
               "'||"
               "/ |
             "~` ~"'
            "(configuring vim coc)
            "(Mostly copy pasted from their github readme)
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" For SCSS vim-coc https://github.com/neoclide/coc-css
autocmd FileType scss setl iskeyword+=@-@




"" Reccomended by CPP/vim-coc setup tutorial
"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
