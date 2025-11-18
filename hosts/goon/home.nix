{
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";
  host.laptop = true;

  profiles = {
    gaming.enable = false;
  };
  programs = {
    fish.enable = true;
    niri.enable = true;
  };
}
