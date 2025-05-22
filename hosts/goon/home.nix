{...}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
    ../../home/dev
    ../../home/profiles/education.nix
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";
  host.laptop = true;

  profiles.gaming.enable = true;
}
