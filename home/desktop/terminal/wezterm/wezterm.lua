local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.front_end = "WebGpu"
config.default_prog = { 'nu' }

return config
