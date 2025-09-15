return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require('alpha');
    local dashboard = require('alpha.themes.dashboard');

    dashboard.section.header.val = {
      [[ ██      ██  ██████████    ██████    ██      ██  ██████  ██      ██ ]],
      [[ ████    ██  ██          ██      ██  ██      ██    ██    ████  ████ ]],
      [[ ██  ██  ██  ██████      ██      ██  ██      ██    ██    ██  ██  ██ ]],
      [[ ██    ████  ██          ██      ██  ██      ██    ██    ██      ██ ]],
      [[ ██      ██  ██          ██      ██    ██  ██      ██    ██      ██ ]],
      [[ ██      ██  ██          ██      ██    ██  ██      ██    ██      ██ ]],
      [[ ██      ██  ██████████    ██████        ██      ██████  ██      ██ ]],
    };

    dashboard.section.buttons.val = {
      dashboard.button('n', '  > New File', function()
        local ok, filename = pcall(vim.fn.input, "Enter new file name: ")

        if not ok then
          return
        end

        if filename == nil or filename == '' then
          filename = "untitled.txt"
        end

        filename = vim.fn.fnameescape(filename)
        if type(filename) ~= "string" then
          return
        end

        vim.cmd("edit " .. filename)
      end),
      dashboard.button('y', '  > Open Yazi', ':Yazi<cr>'),
--      dashboard.button('e', '  > Open Tree', ':NvimTreeToggle .<cr>'),
      dashboard.button('e', '  > Open Tree', ':Neotree position=current<cr>'),
--      dashboard.button('d', '󱧼  > Open Dotfiles', ':NvimTreeToggle ~/.config/<cr>'),
      dashboard.button('d', '󱧼  > Open Dotfiles', ':Neotree position=current ~/.config/<cr>'),
      dashboard.button('f', '󰱼  > Find Files', ':Telescope find_files<cr>'),
      dashboard.button('w', '  > Find Word', ':Telescope live_grep<cr>'),
      dashboard.button('l', '󰒲  > Lazy', ':Lazy<cr>'),
      dashboard.button('q', '  > Exit', ':qa<cr>'),
    };

    alpha.setup(dashboard.opts);

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'netrw',
      callback = function()
        vim.cmd('Alpha');
      end,
    });
  end,
}
