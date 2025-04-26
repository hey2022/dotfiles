{pkgs, ...}: {
  imports = [
    ./minecraft
    ./reshade.nix
    ./roblox
  ];
  home.packages = with pkgs; [mindustry];
}
