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
"Plug 'leafOfTree/vim-svelte-plugin'
Plug 'evanleck/vim-svelte'
Plug 'HerringtonDarkholme/yats.vim'


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
Plug 'NLKNguyen/papercolor-theme'
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
:au BufWrite *.svelte Prettier

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
???LINES MISSING
???LINES MISSING
???LINES MISSING
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
