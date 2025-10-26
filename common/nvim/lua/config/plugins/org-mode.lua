return {
    {
        "orgmode",
        for_cat = "languages.org-mode",
        after = function(_)
            require("orgmode").setup({
                org_agenda_files = { "~/documents/org/agenda.org", "~/documents/school/school.org" },
                org_default_notes_file = "~/documents/org/refile.org",
            })
        end,
    },
}
