local opt = vim.opt;

opt.relativenumber = true;
opt.number = true;
opt.wrap = false;
opt.cursorline = true;

opt.tabstop = 2;
opt.softtabstop = 2;
opt.shiftwidth = 2;
opt.expandtab = true;
opt.smartindent = true;

opt.swapfile = false;
opt.backup = false;
opt.undodir = os.getenv('HOME') .. '/.vim/undodir';
opt.undofile = true;

opt.scrolloff = 4;

opt.updatetime = 50;

opt.termguicolors = true;
opt.isfname:append('@-@');

opt.ignorecase = true;
opt.smartcase = true;
opt.hlsearch = false;
opt.incsearch = true;

opt.iskeyword:append('-');
opt.autochdir = false;
opt.path:append('**');
