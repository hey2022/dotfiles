{ lib, ... }:
{
  imports = [
    ./ai
    ./automount.nix
    ./cloudflared.nix
    ./fail2ban.nix
    ./iperf.nix
    ./jellyseer.nix
    ./kanata.nix
    ./minecraft.nix
    ./pipewire.nix
    ./printing.nix
    ./prometheus
    ./qbittorrent.nix
    ./ssh.nix
    ./syncthing.nix
    ./tailscale.nix
  ];

  options = {
    homelab =
      with lib.types;
      let
        portType = either ints.u16 str;
        serviceType = submodule (
          { name, ... }:
          {
            options = {
              expose = lib.mkOption {
                description = "Whether to expose service";
                type = bool;
                default = true;
              };
              subdomain = lib.mkOption {
                description = "Subdomain of service";
                type = str;
                default = name;
              };
              port = lib.mkOption {
                description = "Internal port of service";
                type = portType;
              };
            };
          }
        );
      in
      {
        enable = lib.mkEnableOption "homelab setup";
        rootService = lib.mkOption {
          type = portType;
        };
        services = lib.mkOption {
          type = attrsOf serviceType;
        };
        mediaDir = lib.mkOption {
          description = "Path to media directory";
          type = path;
          default = "/srv/media";
        };
      };
  };
}
