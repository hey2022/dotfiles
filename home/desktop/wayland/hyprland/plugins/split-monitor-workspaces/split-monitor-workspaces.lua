local lib = require("lib")
local smw = require("plugins.split-monitor-workspaces")
local bind = lib.bind

smw.setup({ workspace_count = 10 })

for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then
        n = "0"
    end
    bind(" + " .. n, smw.workspace(n))
    bind(" + SHIFT +" .. n, smw.move_to_workspace_silent(n))
end
