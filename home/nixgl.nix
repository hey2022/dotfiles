{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/exzombie/home-manager-smona/refs/heads/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "63d97d971edc98656a3ccde4df3aab278b15a25dbc58f1b91e1395a19ea22ccf";
    })
  ];

  nixGL.packages = lib.mkIf (!builtins.pathExists "/etc/NIXOS") inputs.nixGL.packages;
}
