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
  ];
  home.packages = with pkgs; [
    python311Packages.grip
    bun
    wget
    neovim
    hyperfine
    meld
  ];
}
