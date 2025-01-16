{pkgs, ...}: let
  fonts = import ../../../lib/fonts.nix {inherit pkgs;};
in {
  home.packages = with fonts; [
    IosevkaCustom
    IosevkaProportionalCustom
  ];
}
