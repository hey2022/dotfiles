{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./github.nix
    ./jujutsu.nix
  ];
  home.packages = with pkgs; [
    onefetch
  ];
  programs = {
    git.enable = true;
    jujutsu.enable = true;
    difftastic.enable = true;
    mergiraf.enable = true;
  };
}
