return {
	{
		"echasnovski/mini.starter",
		version = false,
		config = function()
			require("mini.starter").setup({
				evaluate_single = true,
				footer = " discipline equals freedom",
				items = {
					{
						action = "Telescope file_browser",
						name = "N: Open file browser",
						section = "What would you like to do?",
					},
					{ action = "Lazy", name = "L: Open Lazy", section = "What would you like to do?" },
					{ action = "enew", name = "E: New Buffer", section = "What would you like to do?" },
					{ action = "qall!", name = "Q: Quit Neovim", section = "What would you like to do?" },
				},
			})

			vim.cmd([[
                augroup MiniStarterJK
                  au!
                  au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
                  au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
                  au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
                  au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>Telescope file_browser<CR>
                augroup END
            ]])
		end,
	},
}
