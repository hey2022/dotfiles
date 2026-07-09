local nix = require("nix")

local config = {
    mainMod = "SUPER",
    terminal = "footclient",
}

for key, value in pairs(nix) do
    config[key] = value
end

return config
