syntax on 
set exrc
set nu
set relativenumber
set hidden
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nohlsearch
set incsearch
set scrolloff=8
set signcolumn=yes
set noswapfile
set nobackup 
"set nowrap

"prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
 
let g:polyglot_disabled = ['vue']

" start of plugins
call plug#begin('~/.vim/plugged')

"Color Scheme : gruvbox
Plug 'morhetz/gruvbox'
"Color Scheme : tokyonight
Plug 'ghifarit53/tokyonight-vim'
"Color Scheme : srcery
Plug 'srcery-colors/srcery-vim'
"Color Scheme : material
Plug 'kaicataldo/material.vim'
"Color Scheme : miramare
Plug 'franbach/miramare'
"Color Scheme : gruvbox-material
Plug 'sainnhe/gruvbox-material'

" LSP and autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

"syntax highlighting packs
Plug 'sheerun/vim-polyglot'

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"self-closing tag
Plug 'alvan/vim-closetag'

"change matching paris automatically
Plug 'tpope/vim-surround'

" add this line to your .vimrc file
Plug 'mattn/emmet-vim'

"javascript custom syntax highlighting
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'

"show indent line
Plug 'Yggdroot/indentLine'

"svelte syntax highlighting
Plug 'evanleck/vim-svelte', {'branch': 'main'}

"commenting
Plug 'tpope/vim-commentary'

"icons
Plug 'ryanoasis/vim-devicons'

call plug#end()
"End of plugins

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['vuels'].setup {
    capabilities = capabilities
  }
EOF


"--AUTOCOMPLETION--
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"automatically open coc-explorer on launch
"autocmd VimEnter * CocCommand explorer 
let g:indentLine_enabled = 1

"set tokyonight theme
" let g:tokyonight_style = 'night'

" set gruvbox-material contrast
" let g:gruvbox_material_background = 'hard'

set background=dark

" let g:srcery_red = '#FF4848'
" let g:srcery_orange = '#66DE93'
" let g:srcery_cyan ='#FA8072' 
" let g:srcery_bright_blue =  '#64C9CF'
" let g:srcery_bright_white = '#FDFCE5'

"customize srcery color
set termguicolors

"set colorscheme
" colorscheme tokyonight
" colorscheme gruvbox
" colorscheme srcery
" colorscheme material
" colorscheme miramare
colorscheme gruvbox-material

"make bg transparent
" highlight Normal ctermbg=NONE
" highlight Normal guibg=NONE

"map emmet-vim
let g:user_emmet_leader_key='<c-f>'

" map coc-explorer
:nnoremap <space>e :CocCommand explorer<CR>

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js'
