{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.profiles.dev;
in
{
  imports = [
    ./android.nix
    ./cpp
    ./emacs
    ./gpg.nix
    ./jq.nix
    ./json.nix
    ./lisp.nix
    ./markdown
    ./neovim.nix
    ./nix
    ./profiling.nix
    ./python.nix
    ./qt.nix
    ./rust
    ./sh.nix
    ./sqlite.nix
    ./typst.nix
    ./vcs
  ];
  options.profiles.dev = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Development profile";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ast-grep
      git-sizer
      just
      onefetch
      rustscan
      tokei
      wget
    ];
  };
}
