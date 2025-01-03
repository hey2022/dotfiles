{pkgs, ...}: {
  imports = [
    ./emacs.nix
    ./git.nix
    ./gpg.nix
    ./nix.nix
    ./java.nix
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
