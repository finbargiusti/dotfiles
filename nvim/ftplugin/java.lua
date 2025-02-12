local lsp_attach = require('lspbindings')

local jdtls_bin = '/opt/homebrew/bin/jdtls'

-- don't forget!
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

local config = {
    cmd = {jdtls_bin},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    on_attach = lsp_attach,
}

require('jdtls').start_or_attach(config)
