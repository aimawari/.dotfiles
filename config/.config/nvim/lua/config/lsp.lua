-- Enable built-in LSP servers
vim.lsp.enable('clangd')
vim.lsp.enable('cmake')
vim.lsp.enable('dartls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')

-- # GLOBAL DEFAULTS
--
-- grr gra grn gri grt i_CTRL-S an in These GLOBAL keymaps are created unconditionally when Nvim starts:
-- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
-- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
-- "grr" is mapped in Normal mode to vim.lsp.buf.references()
-- "gri" is mapped in Normal mode to vim.lsp.buf.implementation()
-- "grt" is mapped in Normal mode to vim.lsp.buf.type_definition()
-- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()
-- "an" and "in" are mapped in Visual mode to outer and inner incremental selections, respectively, using vim.lsp.buf.selection_range()
-- # BUFFER-LOCAL DEFAULTS
--
-- 'omnifunc' is set to vim.lsp.omnifunc(), use i_CTRL-X_CTRL-O to trigger completion.
-- 'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.
-- 'formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it.
-- To opt out of this use gw instead of gq, or clear 'formatexpr' on LspAttach.
-- K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.

-- LSP client attach configuration
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local bufnr = ev.buf

        -- Check if the client supports completion
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }

            -- Enable LSP completion (requires Neovim 0.11+)
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

            -- Map Ctrl-j to trigger completion manually
            vim.keymap.set('i', '<C-j>', vim.lsp.completion.get, { buffer = bufnr, desc = 'Trigger LSP Completion' })
        end
    end,
})

-- Diagnostic configuration
vim.diagnostic.config({
    -- Only show virtual line diagnostics on the current line
    virtual_lines = {
        current_line = true,
    },
})
