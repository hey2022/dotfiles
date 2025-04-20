{pkgs, ...}: {
  imports = [
    ./minecraft
    ./roblox.nix
  ];
  home.packages = with pkgs; [mindustry];
}
