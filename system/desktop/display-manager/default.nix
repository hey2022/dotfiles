{
  imports = [
    ./greetd.nix
    ./ly.nix
    ./regreet.nix
  ];
  programs.regreet.enable = true;
}
