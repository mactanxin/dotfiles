local status_ok, minimap = pcall(require, "neo-minimap") -- for shorthand use later
if not status_ok then
	return
end

minimap.set("zp", "typescriptreact", { -- press `zi` to open the minimap, in `typescriptreact` files
	query = [[
;; query
((function_declaration) @cap) ;; matches function declarations
((arrow_function) @cap) ;; matches arrow functions
((identifier) @cap (#vim-match? @cap "^use.*")) ;; matches hooks (useState, useEffect, use***, etc...)
  ]],
})

minimap.set("<leader>mm", "vue", { -- press `zi` to open the minimap, in `typescriptreact` files
	query = [[
;; query
((function_declaration) @cap) ;; matches function declarations
((arrow_function) @cap) ;; matches arrow functions
((identifier) @cap (#vim-match? @cap "^on.*")) ;; matches hooks (useState, useEffect, use***, etc...)
  ]],
})
minimap.set("<leader>mm", "typescript", { -- press `zi` to open the minimap, in `typescriptreact` files
	query = [[
;; query
((function_declaration) @cap) ;; matches function declarations
((arrow_function) @cap) ;; matches arrow functions
((identifier) @cap (#vim-match? @cap "^on.*")) ;; matches hooks (useState, useEffect, use***, etc...)
  ]],
})
-- Lua
minimap.set("<leader>mm", "lua", { -- press `zi` to open the minimap, in `lua` files
	query = [[
;; query
((for_statement) @cap) ;; matches for loops
((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap) ;; matches vim.keymap.set
((function_declaration) @cap) ;; matches function declarations
  ]],
	search_patterns = {
		{ "function", "<C-j>", true }, -- jump to the next 'function' (Vim pattern)
		{ "function", "<C-k>", false }, -- jump to the previous 'function' (Vim pattern)
		{ "keymap", "<A-j>", true }, -- jump to the next 'keymap' (Vim pattern)
		{ "keymap", "<A-k>", false }, -- jump to the previous 'keymap' (Vim pattern)
	},
})
