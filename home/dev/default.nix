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
    ./cpp.nix
    ./cyber-security.nix
    ./emacs
    ./gpg.nix
    ./java.nix
    ./jq.nix
    ./json.nix
    ./julia.nix
    ./lisp.nix
    ./markdown
    ./neovim.nix
    ./nix
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
      bun
      flamegraph
      hyperfine
      just
      onefetch
      tokei
      wget
    ];
  };
}
