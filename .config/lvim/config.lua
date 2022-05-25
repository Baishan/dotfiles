--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "monokai"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":update<cr>"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:update<cr>"
lvim.keys.visual_mode["<C-s>"] = "<C-C>:update<cr>"
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false
lvim.builtin.dap.active = true


function TableConcat(t1,t2)
   for i=1,#t2 do
      t1[#t1+1] = t2[i]
   end
   return t1
end

lvim.lsp.buffer_mappings.normal_mode["<C-F>"] = { "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>", "Find in buffer"}
lvim.lsp.buffer_mappings.normal_mode["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>", "Debug Continue"}
lvim.lsp.buffer_mappings.normal_mode["<S-F5>"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Debug Disconnect"}
lvim.lsp.buffer_mappings.normal_mode["<F6>"] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Debug Pause"}
lvim.lsp.buffer_mappings.normal_mode["<F7>"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Debug UI Toggle"}
lvim.lsp.buffer_mappings.normal_mode["<F8>"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Debug Run To Cursor"}
lvim.lsp.buffer_mappings.normal_mode["<F9>"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Debug Breakpoint"}
lvim.lsp.buffer_mappings.normal_mode["<F10>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Debug Step Over"}
lvim.lsp.buffer_mappings.normal_mode["<S-F10>"] = { "<cmd>lua require'dap'.step_back()<cr>", "Debug Step Back"}
lvim.lsp.buffer_mappings.normal_mode["<F11>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Debug Step Into"}
lvim.lsp.buffer_mappings.normal_mode["<S-F11>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Debug Step Out"}
lvim.lsp.buffer_mappings.normal_mode["<space>dv"] = { "<cmd>Telescope dap variables<cr>", "Variables" }
lvim.lsp.buffer_mappings.normal_mode["<space>df"] = { "<cmd>Telescope dap frames<cr>", "Frames" }
lvim.lsp.buffer_mappings.normal_mode["<space>db"] = { "<cmd>Telescope dap breakpoints<cr>", "Breakpoints" }
lvim.lsp.buffer_mappings.normal_mode["<space>dc"] = { "<cmd>Telescope dap commands<cr>", "Commands" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>lua require'telescope.builtin'.lsp_references()<cr>", "References" }


local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end 

-- lvim.keys.normal_mode["<C-Up>"] = false
-- unmap a default keymapping
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "elixir",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "folke/trouble.nvim" },
  { "ggandor/leap.nvim" },
  { "tpope/vim-surround" },
  { "crusoexia/vim-monokai" },
  { "christoomey/vim-tmux-navigator" },
  { "mfussenegger/nvim-dap-python" },
  { "leoluz/nvim-dap-go" },
  { "rcarriga/nvim-dap-ui" }
}

vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf"
  },
  cache_enable = 0,
}

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('leap').set_default_keymaps()
require('dap-go').setup()
require("dapui").setup()
require('telescope').load_extension('dap')
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
