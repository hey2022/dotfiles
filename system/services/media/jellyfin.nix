{...}: {
  services.jellyfin = {
    enable = true;
    group = "media";
    openFirewall = true;
  };
}
