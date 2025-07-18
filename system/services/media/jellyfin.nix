{
  services.jellyfin = {
    enable = true;
    group = "media";
  };
  hostedServices.jellyfin = 8096;
}
