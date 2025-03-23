{pkgs, ...}: let
  fonts = import ../../../common/fonts.nix {inherit pkgs;};
in {
  home.packages = with fonts; [
    IosevkaCustom
    IosevkaProportionalCustom
  ];
}
