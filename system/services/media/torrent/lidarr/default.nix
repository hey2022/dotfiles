{...}: {
  imports = [./beets.nix];
  services.lidarr = {
    enable = true;
    group = "media";
    openFirewall = true;
  };
}
