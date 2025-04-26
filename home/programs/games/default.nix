{pkgs, ...}: {
  imports = [
    ./minecraft
    ./reshade.nix
    ./roblox.nix
  ];
  home.packages = with pkgs; [mindustry];
}
