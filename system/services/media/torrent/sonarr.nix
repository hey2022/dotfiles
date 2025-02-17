{...}: {
  services.sonarr = {
    enable = true;
    group = "media";
    openFirewall = true;
  };
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "aspnetcore-runtime-6.0.36"
  ];
}
