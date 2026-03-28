{
  imports = [
    ../../home
    ../../home/desktop
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";
  host.laptop = true;
  home.stateVersion = "25.11";

  profiles = {
    gaming.enable = true;
  };
  programs = {
    fish.enable = true;
    niri.enable = true;
    fjord.enable = true;
  };
}
