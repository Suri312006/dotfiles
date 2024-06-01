
require("todo-comments").setup()
vim.keymap.set("n", "<leader>lt", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true })
