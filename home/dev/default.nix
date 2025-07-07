{ pkgs, ... }:
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
    ./neovim
    ./nix.nix
    ./python.nix
    ./rust
    ./sh.nix
    ./typst.nix
    ./vcs
  ];
  home.packages = with pkgs; [
    bun
    hyperfine
    just
    onefetch
    tokei
    wget
  ];
}
