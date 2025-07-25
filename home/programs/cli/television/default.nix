{ config, pkgs, ... }:

let
  # TODO: https://nixpk.gs/pr-tracker.html?pr=423662
  television-overlay = final: prev: {
    television = prev.television.overrideAttrs (prevAttrs: rec {
      version = "0.12.4";
      src = prev.fetchFromGitHub {
        owner = "alexpasmantier";
        repo = "television";
        tag = version;
        hash = "sha256-J4z0QKw4P2auIbp6SU+XsA/hCJJCN5WUIVwZJAICSrs=";
      };
      cargoDeps = prev.rustPlatform.fetchCargoVendor {
        inherit src;
        hash = "sha256-ASJ3QXe4AqEtTdezwWvWvTIdKazQv+1Hr9gcjG6HcsE=";
      };
      doCheck = false;
    });
  };
in
{
  nixpkgs.overlays = [ television-overlay ];
  programs.television = {
    enable = true;
  };
  home.packages = with pkgs; [
    bat
    fd
    nix-search-tv
    ripgrep
  ];
  xdg.configFile."television/cable".source = config.lib.hm.mkFlakeSymlink ./cable;
}
