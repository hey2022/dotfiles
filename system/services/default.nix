{ lib, ... }:
{
  imports = [
    ./ai
    ./automount.nix
    ./cloudflared.nix
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
      type =
        with lib.types;
        let
          portType = either ints.u16 str;
        in
        attrsOf (
          either portType (submodule {
            options = {
              port = lib.mkOption { type = portType; };
              root = lib.mkOption {
                type = bool;
                default = false;
              };
            };
          })
        );
    };
  };
}
