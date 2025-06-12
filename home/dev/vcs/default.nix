{pkgs, ...}: {
  imports = [
    ./git.nix
    ./github.nix
    ./jujutsu.nix
  ];
  home.packages = with pkgs; [
    gitbutler
    onefetch
  ];
}
