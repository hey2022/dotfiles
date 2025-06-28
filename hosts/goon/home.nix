{...}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
    ../../home/dev
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";
  host.laptop = true;

  profiles = {
    gaming.enable = false;
    entertainment = {
      anime.enable = false;
    };
  };
}
