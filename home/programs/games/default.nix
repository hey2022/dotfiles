{pkgs, ...}: {
  imports = [
    ./minecraft
    ./reshade-shaders
    ./reshade.nix
    ./roblox
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
