local wezterm = require "wezterm"

return {
  front_end = "WebGpu",

  color_scheme = "Catppuccin Mocha",

  window_background_opacity = 0.9,

  tab_bar_at_bottom = true,
  window_frame = {
    active_titlebar_bg = "rgba(0,0,0,0)",
    inactive_titlebar_bg = "rgba(0,0,0,0)",
  },

  default_prog = { "fish" },

  keys = {
    {key="n", mods="ALT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key="d", mods="ALT", action=wezterm.action{CloseCurrentTab={confirm=true}}},

    {key="h", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="l", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},
    {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
    {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
    {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
    {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
    {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
    {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
    {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
    {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
    {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},
    {key="0", mods="ALT", action=wezterm.action{ActivateTab=9}},
  },
}
