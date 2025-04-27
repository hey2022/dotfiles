{pkgs, ...}: {
  imports = [
    ./minecraft
    ./reshade-shaders
    ./reshade.nix
    ./roblox
    ./vkbasalt.nix
    ./wclicker
  ];
  home.packages = with pkgs; [
    mindustry
    goverlay
  ];
  programs.mangohud = {
    enable = true;
  };
}
