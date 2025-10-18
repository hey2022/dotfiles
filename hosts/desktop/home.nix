{
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  profiles = {
    entertainment.enable = true;
    gaming.enable = true;
  };
  programs.niri.enable = true;
}
