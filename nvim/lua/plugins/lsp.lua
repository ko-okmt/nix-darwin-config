return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- Go
				gopls = {
					mason = false,
					settings = {
						gopls = {
							analyses = {
								unusedparams = true,
							},
							staticcheck = true,
						},
					},
				},

				-- TypeScript / JavaScript
				vtsls = {},

				-- Ruby
				ruby_lsp = {
					mason = false,
				},

				-- JSON
				jsonls = {},

				-- typo
				typos_lsp = {},

				-- YAML
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
							format = {
								enable = true,
							},
							validate = true,
							hover = true,
							completion = true,
							schemas = {
								-- JSON schema store integration
								["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
								["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
								["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
							},
						},
					},
				},
			},
		},
	},
}
