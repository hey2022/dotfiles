{pkgs, ...}: {
  imports = [
    ./emacs.nix
    ./git.nix
    ./gpg.nix
    ./nix.nix
    ./java.nix
    ./python.nix
    ./cyber-security.nix
    ./sh.nix
    ./lisp.nix
    ./rust.nix
    ./markdown.nix
  ];
  home.packages = with pkgs; [
    bun
    wget
    neovim
    hyperfine
    meld
  ];
}
