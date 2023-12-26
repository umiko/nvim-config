function ApplyColors(color)
    

    --	require("tokyonight").setup({
--		style="storm",
--		transparent = true,
--		terminal_colors = true,
--		styles = {
--			comments = { italic = false},
--			keywords = {italic = false},
--		}
--	})
	vim.cmd.colorscheme("catppuccin-latte")
--	vim.cmd.colorscheme("catppuccin-frappe")
--	vim.cmd.colorscheme("catppuccin-macchiato")
--	vim.cmd.colorscheme("catppuccin-mocha")
--	vim.api.nvim_set_hl(0,"Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0,"NormalFloat", { bg = "none" })
end

ApplyColors()
