{ pkgs, ... }:

let
  format = pkgs.formats.toml { };
in
{
  home.packages = [ pkgs.nix-init ];
  xdg.configFile."nix-init/config.toml".source = format.generate "config.toml" {
    maintainers = [ "hey2022" ];
    nixpkgs = "builtins.getFlake \"nixpkgs\"";
  };
}
