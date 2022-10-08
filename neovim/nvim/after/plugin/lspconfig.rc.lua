local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- TODO protocol being called but not being used. Remove it not causing any problems
local protocol = require('vim.lsp.protocol')

-- TODO Supposed to remove bufnr if not breaking without it cause it is not accessed by anything
local on_attach = function(client, bufnr) -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- TODO Setup pyright for python language server as well and Clang for C
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  filetypes = { "python" },
  cmd = { "pyright-langserver", "--stdio" }
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Getting the language server to recognize 'vim' global
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}
