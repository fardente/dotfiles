return {
  'max397574/better-escape.nvim',
  config = function()
    require('better_escape').setup {
      timeout = vim.o.timeoutlen,
      default_mappings = true, -- keep default mappings like 'jk' and 'jj'

      -- Add custom mappings
      mappings = {
        -- Insert mode mappings
        i = {
          k = {
            k = '<Esc>', -- kk -> esc
          },
        },
      },
    }
  end,
}
