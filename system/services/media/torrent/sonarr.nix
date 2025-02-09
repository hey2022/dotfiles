{...}: {
  services.sonarr = {
    enable = true;
    group = "media";
  };
  services.homepage-dashboard.services.media.sonarr = {
    icon = "sonarr.svg";
    href = "http://localhost:8989";
  };
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "aspnetcore-runtime-6.0.36"
  ];
}
