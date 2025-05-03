{...}: {
  services.sonarr = {
    enable = true;
    group = "media";
    openFirewall = true;
  };
}
