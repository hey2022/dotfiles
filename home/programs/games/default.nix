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
    goverlay
    mindustry
    steam
  ];
  programs.mangohud = {
    enable = true;
  };
}
