{ inputs, ... }:

{
  imports = [
    (inputs.import-tree ../../home/desktop)
    ../../home
  ];
  home = {
    username = "yiheng";
    homeDirectory = "/home/yiheng";
    stateVersion = "25.05";
  };

  profiles = {
    gaming.enable = true;
  };
  programs = {
    fish.enable = true;
  };
  wayland.windowManager.hyprland.enable = true;
}
