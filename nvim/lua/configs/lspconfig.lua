local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- require('java').setup()

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true
}

mason_lspconfig.setup_handlers {
function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = require('lspbindings'),
      settings = servers[server_name],
    }
  end,
  ['pyright'] = function() 
    local bindings = require('lspbindings')
    local on_attach = function(_, bufnr)
      bindings(_, bufnr)
      -- overwrite the lsp format command with a custom one
      -- since pyright doesn't support formatting
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.cmd('!black % > /dev/null')
      end, { desc = 'Format current buffer with LSP', force=true })
    end
    require('lspconfig')['pyright'].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
  end,
  -- we handle this one separately
  ['jdtls'] = function() end
}
