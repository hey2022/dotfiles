{
  imports = [
    ./greetd.nix
    ./ly.nix
  ];
  services.displayManager.regreet.enable = true;
}
