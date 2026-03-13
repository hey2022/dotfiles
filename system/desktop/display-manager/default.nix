{
  imports = [
    ./ly.nix
    ./regreet.nix
  ];
  services.displayManager.ly.enable = true;
}
