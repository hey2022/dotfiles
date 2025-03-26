{pkgs, ...}: {
  imports = [
    ./cpp.nix
    ./cyber-security.nix
    ./emacs.nix
    ./git.nix
    ./gpg.nix
    ./java.nix
    ./jq.nix
    ./json.nix
    ./julia.nix
    ./lisp.nix
    ./markdown.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./sh.nix
  ];
  home.packages = with pkgs; [
    bun
    hyperfine
    neovim
    onefetch
    tokei
    wget
  ];
}
