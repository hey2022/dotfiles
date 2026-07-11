{
  imports = [
    ../../home
    ../../home/desktop
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";
  home.stateVersion = "25.05";

  profiles = {
    gaming.enable = true;
  };
  programs = {
    fish.enable = true;
    fjord.enable = true;
  };
  wayland.windowManager.hyprland.enable = true;
}
