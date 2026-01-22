-- Leader mapping
vim.g.mapleader = " "

-- Save
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })

vim.keymap.set("n", "<leader>e", function()
	require("oil").open(vim.fn.expand("%:p:h"))
end, { desc = "Open Oil (current file dir)" })

-- Harpoon Mappings
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		require("harpoon"):list():select(i)
	end, { desc = "Harpoon goto " .. i })
end

-- Telescope Mappings
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Help tags" })

-- Prettier Mappings
vim.keymap.set("n", "<leader>p", function()
	require("conform").format({ async = true })
end, { desc = "Format with Prettier" })

-- TSTools Mappings
vim.keymap.set("n", "<leader>rf", "<cmd>TSToolsFileReferences<cr>", { desc = "Check all import references" })
vim.keymap.set("n", "<leader>rn", "<cmd>TSToolsRenameFile<cr>", { desc = "Rename files" })

-- FZF Lua Mappings
local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>ff", function()
	fzf.files({
		fd_opts = "--type f --exclude node_modules",
	})
end, { desc = "[F]ind [F]iles" })

vim.keymap.set("n", "<leader>fw", function()
	fzf.live_grep_native({ cmd = "rg --color=always --smart-case -g '!{.git,node_modules}/'" })
end, { desc = "[F]ind [W]ord" })

vim.keymap.set("n", "<leader>fw", fzf.live_grep_native, { desc = "[F]ind [W]ord" })
vim.keymap.set("n", "<leader>fb", fzf.git_branches, { desc = "[F]ind by Git [B]ranches" })
vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "[F]ind by Git [B]ranches" })
vim.keymap.set("n", "<leader>fn", function()
	fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind [N]eovim files" })
vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
