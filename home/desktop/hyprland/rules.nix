{...}: {
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "special:scratchpad, gapsout:100, on-created-empty:$term"
    ];

    windowrulev2 = [
      # Ignore maximize requests from apps
      "suppressevent maximize, class:.*"

      # Fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      # scratchpad only with terminal
      "workspace +0, onworkspace:special:scratchpad, floating:0, class:negative:(com.mitchellh.ghostty)"

      # copyq
      "float, class:copyq"
      "size 25% 25%, class:copyq"
      "move 100%-w-10, class:copyq"
    ];
  };
}
