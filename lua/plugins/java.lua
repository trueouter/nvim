return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local jdtls = require('jdtls')
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
      local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspaces/' .. project_name

      jdtls.start_or_attach({
        cmd = { 'jdtls', '-data', workspace_dir },
        root_dir = require('jdtls.setup').find_root({
          '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle', 'build.gradle.kts',
        }),
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
    end,
  },
}
