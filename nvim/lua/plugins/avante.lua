return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	opts = {
		provider = "openai",
		auto_suggestions_provider = "openai",
		openai = {
			endpoint = "https://api.deepseek.com/v1",
			model = "deepseek-chat",
			max_tokens = 4096,
		}
	-- add any opts here
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"hrsh7th/nvim-cmp",
	}
}
