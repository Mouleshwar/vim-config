filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set foldmethod=indent
set foldlelvel=99

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
map <leader>n :NERDTreeToggle<CR>
nmap <leader>a <Esc>:Ack!
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen<CR>

syntax on
filetype on
filetype plugin indent on

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

%{fugitive#statusline()}

" Add the virtualenv's site-packages to vim path
py << ROF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

export DJANGO_SETTINGS_MODULE=project.settings

