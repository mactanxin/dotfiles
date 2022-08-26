-- See `:help vim.diagnostic.*` for documentation on any of the below functions
require("lsp-format").setup({})
require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	--[[ require "lsp-format".on_attach(client) ]]
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	if client.server_capabilities.colorProvider then
		-- Attach document colour support
		require("document-color").buf_attach(bufnr)
	end
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

-- Capability check for tailwind lsp protocol
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- You are now capable!
capabilities.textDocument.colorProvider = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
local util = require("vim.lsp.util")

local formatting_callback = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

require("lspconfig").eslint.setup({})

require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig")["svelte"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	filetypes = { "svelte" },
	settings = {
		svelte = {
			plugin = {
				html = { completions = { enable = true, emmet = false } },
				svelte = { completions = { enable = true, emmet = false } },
				css = { completions = { enable = true, emmet = true } },
			},
		},
	},
})

require("lspconfig").tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").volar.setup({
	--[[ on_attach = on_attach, ]]
	on_attach = function(client, bufnr)
		formatting_callback(client, bufnr)
		on_attach(client, bufnr)
	end,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	capabilities = capabilities,
	flags = lsp_flags,
	init_options = {
		typescript = {
			serverPath = ts_server,
		},
		languageFeatures = {
			references = true,
			definition = true,
			typeDefinition = true,
			callHierarchy = true,
			hover = false,
			rename = true,
			signatureHelp = true,
			codeAction = true,
			completion = {
				defaultTagNameCase = "both",
				defaultAttrNameCase = "kebabCase",
			},
			schemaRequestService = true,
			documentHighlight = true,
			codeLens = true,
			semanticTokens = true,
			diagnostics = true,
		},
		documentFeatures = {
			selectionRange = true,
			foldingRange = true,
			linkedEditingRange = true,
			documentSymbol = true,
			documentColor = true,
		},
	},
	settings = {
		volar = {
			codeLens = {
				references = true,
				pugTools = true,
				scriptSetupTools = true,
			},
		},
	},
})

require("lspconfig").cssls.setup({
	on_attach = on_attach,
	filetypes = { "css", "scss", "less" },
	capabilities = capabilities,
})
