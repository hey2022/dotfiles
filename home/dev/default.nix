{pkgs, ...}: {
  imports = [
    ./cpp.nix
    ./cyber-security.nix
    ./emacs
    ./git.nix
    ./github.nix
    ./gpg.nix
    ./java.nix
    ./jq.nix
    ./json.nix
    ./jujutsu.nix
    ./julia.nix
    ./lisp.nix
    ./markdown.nix
    ./neovim
    ./nix.nix
    ./python.nix
    ./rust
    ./sh.nix
  ];
  home.packages = with pkgs; [
    bun
    hyperfine
    onefetch
    tokei
    wget
  ];
}
