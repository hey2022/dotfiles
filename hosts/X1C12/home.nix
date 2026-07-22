{
  imports = [
    ../../home
    ../../home/desktop
  ];
  home = {
    username = "yiheng";
    homeDirectory = "/home/yiheng";
    stateVersion = "25.11";
  };
  host.laptop = true;

  profiles = {
    gaming.enable = true;
    productivity.images.enable = true;
  };
  programs = {
    fish.enable = true;
    fjord.enable = true;
  };
  wayland.windowManager.hyprland.enable = true;
}
