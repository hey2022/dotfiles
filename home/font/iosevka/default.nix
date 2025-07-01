{ pkgs-stable, ... }:
let
  fonts = import ../../../common/fonts.nix { pkgs = pkgs-stable; };
in
{
  home.packages = with fonts; [
    IosevkaCustom
    IosevkaProportionalCustom
  ];
}
