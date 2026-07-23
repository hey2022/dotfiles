{
  imports = [
    ../../home
    ../../home/desktop
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
