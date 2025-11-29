{
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  profiles = {
    gaming.enable = true;
  };
  programs = {
    fish.enable = true;
    niri.enable = true;
  };
}
