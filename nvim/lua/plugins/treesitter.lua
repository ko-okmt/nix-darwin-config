return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"javascript",
			"lua",
			"typescript",
			"go",
			"svelte", -- ← ここに任意の言語を追記
		},
	},
}
