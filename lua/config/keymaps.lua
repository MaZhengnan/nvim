-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true, silent = true })

local wk = require("which-key") -- 加载 which-key

-- 定义快捷键和对应描述
local mappings = {
  ["<leader>t"] = { name = "+tasks" }, -- 主菜单
  ["<leader>tc"] = { ":Task configure<CR>", "CMake Configure" },
  ["<leader>tb"] = { ":Task build<CR>", "CMake Build" },
  ["<leader>tcl"] = { ":Task clean<CR>", "CMake Clean" },
  ["<leader>tr"] = { ":Task run<CR>", "Run Project" },
}

-- 注册到 which-key
wk.register(mappings)

-- 绑定快捷键
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>tc", ":Task configure<CR>", opts)
vim.keymap.set("n", "<leader>tb", ":Task build<CR>", opts)
vim.keymap.set("n", "<leader>tcl", ":Task clean<CR>", opts)
vim.keymap.set("n", "<leader>tr", ":Task run<CR>", opts)
