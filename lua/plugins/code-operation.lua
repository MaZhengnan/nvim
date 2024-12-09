return {
  -- 安装 neovim-tasks 插件
  {
    "Shatur/neovim-tasks",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local tasks = require("tasks")
      -- 配置 neovim-tasks
      tasks.setup({
        save_before_run = true,
        quickfix = {
          pos = "botright",
          height = 10,
        },
        runners = {
          cmake = {
            command = "cmake",
            tasks = {
              configure = {
                command = "cmake -S . -B build",
                description = "Configure the project",
              },
              build = {
                command = "cmake --build build",
                description = "Build the project",
              },
              clean = {
                command = "cmake --build build --target clean",
                description = "Clean build artifacts",
              },
              run = {
                command = "build/<target_name>", -- 替换 <target_name> 为可执行目标
                description = "Run the target",
              },
            },
          },
          python = {
            command = "python",
            tasks = {
              run = {
                command = "python %",
                description = "Run the Python script",
              },
              lint = {
                command = "flake8 %",
                description = "Lint the Python script",
              },
              format = {
                command = "black %",
                description = "Format the Python script",
              },
            },
          },
        },
      })
      -- 配置快捷键
      local wk = require("which-key")
      wk.add({
        ["<leader>t"] = { name = "+tasks" }, -- 主菜单
        ["<leader>tc"] = { ":Task configure<CR>", "CMake Configure" },
        ["<leader>tb"] = { ":Task build<CR>", "CMake Build" },
        ["<leader>tcl"] = { ":Task clean<CR>", "CMake Clean" },
        ["<leader>tr"] = { ":Task run<CR>", "Run Project" },
        ["<leader>tp"] = { ":Task python run<CR>", "Run Python Script" },
        ["<leader>tl"] = { ":Task python lint<CR>", "Lint Python Script" },
        ["<leader>tf"] = { ":Task python format<CR>", "Format Python Script" },
        ["<leader>td"] = { ":Task debug<CR>", "Debug Current Task" },
      }, { prefix = "<leader>" })
    end,
  },
}
