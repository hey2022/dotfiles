{...}: {
  imports = [
    ./homepage.nix
    ./ssh.nix
    ./tailscale.nix
    ./syncthing.nix
    ./automount.nix
    ./pipewire.nix
    ./ai
  ];
}
