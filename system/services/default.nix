{ lib, ... }:
{
  imports = [
    ./ai
    ./automount.nix
    ./fail2ban.nix
    ./iperf.nix
    ./kanata.nix
    ./minecraft.nix
    ./pipewire.nix
    ./printing.nix
    ./prometheus
    ./ssh.nix
    ./syncthing.nix
    ./tailscale.nix
  ];
  options = {
    hostedServices = lib.mkOption {
      type = with lib.types; attrsOf (either ints.u16 str);
      description = "A set of services with their names as keys and ports as values.";
    };
  };
}
