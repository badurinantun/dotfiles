return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
        org_startup_indented = true,
        org_adapt_indentation = true,
      })
    end,
    dependencies = {
      {
        'akinsho/org-bullets.nvim',
        config = function()
          require('org-bullets').setup({
            symbols = {
              list = "•",
              headlines = { "◉", "○", "✸", "✿" },
              checkboxes = {
                half = { "", "OrgTSCheckboxHalfChecked" },
                done = { "✓", "OrgDone" },
                todo = { "˟", "OrgTODO" },
              },
            }
          })
        end
      }
    }
  }
}
