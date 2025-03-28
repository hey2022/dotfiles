{
  config,
  lib,
  ...
}: let
  toggle = program: "pkill ${program} || uwsm-app -- ${program}";
  runOnce = program: "pgrep ${program} || uwsm-app -- ${program}";
  hy3 = config.wayland.windowManager.hyprland.hy3;
  hy3Prefix =
    if hy3
    then "hy3:"
    else "";
in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$menu" = "wofi --show drun";
    "$playerctl_flags" = "-i firefox";

    bind =
      [
        # programs
        "$mod, Return, exec, uwsm-app -- foot"
        "$mod SHIFT, Return, exec, uwsm-app -- emacsclient -c"
        "$mod, E, exec, uwsm-app -- foot fish -C y"

        # compositor commands
        "$mod, Q, killactive,"
        "$mod SHIFT, Q, exec, hyprctl activewindow -j | jq '.pid' | xargs kill -9"
        "$mod SHIFT, E, exec, uwsm stop"
        "$mod, F, fullscreen,"
        "$mod, V, togglefloating,"

        # move focus
        "$mod, H, ${hy3Prefix}movefocus, l"
        "$mod, J, ${hy3Prefix}movefocus, d"
        "$mod, K, ${hy3Prefix}movefocus, u"
        "$mod, L, ${hy3Prefix}movefocus, r"

        # move window
        "$mod SHIFT, H, ${hy3Prefix}movewindow, l"
        "$mod SHIFT, J, ${hy3Prefix}movewindow, d"
        "$mod SHIFT, K, ${hy3Prefix}movewindow, u"
        "$mod SHIFT, L, ${hy3Prefix}movewindow, r"

        # Switch workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # special workspace
        "$mod, MINUS, settiled"
        "$mod, MINUS, movetoworkspace, +0"
        "$mod, TAB, togglespecialworkspace, special"
        "$mod SHIFT, TAB, exec, hyprctl --batch \"dispatch setfloating; dispatch resizeactive exact 75% 75%; dispatch centerwindow; dispatch movetoworkspace special\""

        # Scroll through existing workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # utility
        # logout menu
        "$mod SHIFT, Escape, exec, ${toggle "wlogout"} -p layer-shell"
        # lock screen
        "$mod, Escape, exec, ${runOnce "hyprlock"} --immediate"

        # screenshot
        # area
        "SHIFT, Print, exec, ${runOnce "grimblast"} --notify copy area"
        "$mod SHIFT, S, exec, ${runOnce "grimblast"} --notify copy area"
        # current window
        "CTRL, Print, exec, ${runOnce "grimblast"} --notify --cursor copy active"
        "$mod CTRL, S, exec, ${runOnce "grimblast"} --notify --cursor copy active"
        # current screen
        ", Print, exec, ${runOnce "grimblast"} --notify --cursor copy output"
        "$mod, S, exec, ${runOnce "grimblast"} --notify --cursor copy output"
        # all screens
        "ALT, Print, exec, ${runOnce "grimblast"} --notify --cursor copy screen"
        "$mod ALT, S, exec, ${runOnce "grimblast"} --notify --cursor copy screen"

        # cycle workspaces
        "$mod, bracketleft, workspace, m-1"
        "$mod, bracketright, workspace, m+1"

        # cycle monitors
        "$mod SHIFT, bracketleft, focusmonitor, l"
        "$mod SHIFT, bracketright, focusmonitor, r"

        # send focused workspace to left/right monitors
        "$mod SHIFT CTRL, bracketleft, movecurrentworkspacetomonitor, l"
        "$mod SHIFT CTRL, bracketright, movecurrentworkspacetomonitor, r"

        # mullvad tunnel
        "$mod, T, exec, hyprctl activewindow -j | jq '.pid' | xargs mullvad split-tunnel add"
        "$mod SHIFT, T, exec, hyprctl activewindow -j | jq '.pid' | xargs mullvad split-tunnel delete"

        # swww-picker
        "$mod, w, exec, ${runOnce "swww-picker"}"

        # launcher
        "$mod, space, exec, ${toggle "fuzzel"} --launch-prefix='uwsm-app -- '"
        "$mod SHIFT, space, exec, pkill fuzzel || fd -t file | fuzzel -d | xargs -d '\\n' uwsm-app -- xdg-open"

        # copyq
        "$mod, C, exec, copyq toggle"

        # swaync
        "$mod, N, exec, swaync-client -t"
        "$mod SHIFT, N, exec, swaync-client -d"
      ]
      ++ (
        if hy3
        then ["$mod, G, hy3:changegroup, toggletab"]
        else [
          "$mod, G, togglegroup"
          "$mod SHIFT, N, changegroupactive, f"
          "$mod SHIFT, P, changegroupactive, b"
        ]
      )
      ++ lib.optional config.host.laptop "$mod, I, exec, toggle-lid-inhibit-lock";

    bindl = [
      # media controls
      ", XF86AudioPlay, exec, playerctl $playerctl_flags play-pause"
      ", XF86AudioPause, exec, playerctl $playerctl_flags pause"
      ", XF86AudioPrev, exec, playerctl $playerctl_flags previous"
      ", XF86AudioNext, exec, playerctl $playerctl_flags next"

      "$mod, P, exec, playerctl $playerctl_flags play-pause"
      "$mod SHIFT, P, exec, playerctl $playerctl_flags stop"
      "$mod, LEFT, exec, playerctl $playerctl_flags previous"
      "$mod, RIGHT, exec, playerctl $playerctl_flags next"
      "$mod SHIFT, LEFT, exec, playerctl $playerctl_flags position 10-"
      "$mod SHIFT, RIGHT, exec, playerctl $playerctl_flags position 10+"

      # volume
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      "$mod, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];

    bindel = [
      # volume
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"
      "$mod, UP, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
      "$mod, DOWN, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"

      # backlight
      "SHIFT, XF86MonBrightnessUp, exec, brightnessctl set 1%+"
      "SHIFT, XF86MonBrightnessDown, exec, brightnessctl set 1%-"
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];

    # mouse movements
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
