return {
   {
   "NeogitOrg/neogit",
   for_cat = 'git',
   keys = {
           { "<leader>gg", function() require('neogit').open() end, mode = {"n"}, desc = 'Open neogit' },
   },
  },
}
