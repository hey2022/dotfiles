{ inputs, pkgs, ... }:

{
  programs.pandoc = {
    # HACK: https://github.com/NixOS/nixpkgs/issues/461018
    package = inputs.nix-pandoc-bin.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
