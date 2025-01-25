{
  inputs,
  pkgs,
  ...
}: let
  zen = inputs.zen-browser.packages.${pkgs.system}.default;
in {
  home.packages = [zen];
  home.file.".local/share/applications/zen.desktop".source = "${zen}/share/applications/zen.desktop";
}
