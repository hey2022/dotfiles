{ pkgs, ... }:

let
  package = pkgs.tealdeer;
in
{
  home.packages = [ package ];
  services.tldr-update = {
    enable = true;
    inherit package;
  };
}
