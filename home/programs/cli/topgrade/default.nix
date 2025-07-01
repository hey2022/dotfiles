{ config, ... }:
let
  topgrade-overlay = final: prev: {
    topgrade = prev.topgrade.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [
        # TODO: remove once merged into nixpkgs https://github.com/topgrade-rs/topgrade/pull/1214
        ./1214.patch
      ];
    });
  };
in
{
  nixpkgs.overlays = [ topgrade-overlay ];
  programs.topgrade = {
    enable = true;
    settings = {
      doom = {
        aot = true;
      };
      misc = {
        assume_yes = true;
        disable = [
          "bun"
          "git_repos"
          "nix"
          "uv"
        ];
        pre_sudo = true;
      };
      linux = {
        nix_arguments = "--flake ${config.home.dotfiles}";
        home_manager_arguments = [
          "--flake"
          "${config.home.dotfiles}"
          "-b"
          "backup"
        ];
      };
    };
  };
}
