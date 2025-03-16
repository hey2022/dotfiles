{...}: {
  imports = [
    ./homepage.nix
    ./ssh.nix
    ./tailscale.nix
    ./syncthing.nix
    ./automount.nix
    ./pipewire.nix
    ./iperf.nix
    ./minecraft.nix
  ];
}
