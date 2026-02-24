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
    niri.enable = true;
    fjord.enable = true;
  };
}
