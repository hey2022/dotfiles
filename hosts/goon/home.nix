{
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";
  host.laptop = true;
  home.stateVersion = "25.05";

  profiles = {
    gaming.enable = true;
  };
  programs = {
    fish.enable = true;
    niri.enable = true;
  };
}
