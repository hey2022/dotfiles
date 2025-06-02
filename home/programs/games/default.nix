{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./minecraft
    ./reshade-shaders
    ./reshade.nix
    ./roblox
    ./vkbasalt.nix
    ./wclicker
  ];
  config = lib.mkIf config.profiles.gaming.enable {
    home.packages = with pkgs; [
      goverlay
      mindustry-wayland
      steam
      superTuxKart
    ];
  };
}
