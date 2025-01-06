{...}: {
  imports = [
    ./ssh.nix
    ./tailscale.nix
    ./syncthing.nix
    ./automount.nix
  ];
}
