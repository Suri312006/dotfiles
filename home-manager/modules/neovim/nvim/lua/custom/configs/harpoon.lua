-- REQUIRED
local harpoon = require('harpoon')
harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end
harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-x>", function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr })
  end,
})
-- this part doesnt let you move around or remove snippers
vim.keymap.set("n", "<C-h>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-e>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-i>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-o>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<C-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<C-7>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<C-8>", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<C-9>", function() harpoon:list():select(9) end)
-- vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end)
-- vim.keymap.set("n", "<C-6>", function() harpoon:list():select(6) end)
-- vim.keymap.set("n", "<C-7>", function() harpoon:list():select(7) end)
-- vim.keymap.set("n", "<C-8>", function() harpoon:list():select(8) end)
-- vim.keymap.set("n", "<C-9>", function() harpoon:list():select(9) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-,>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-.>", function() harpoon:list():next() end)
