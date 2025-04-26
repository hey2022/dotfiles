{pkgs, ...}: {
  imports = [
    ./minecraft
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
