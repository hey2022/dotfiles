{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.uuplugin;
in
{
  options.services.uuplugin = {
    enable = lib.mkEnableOption "NetEase UU Plugin";
    package = lib.mkPackageOption pkgs "uuplugin" { };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.uuplugin = {
      description = "NetEase UU Plugin";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      path = with pkgs; [
        iptables
        iproute2
      ];

      serviceConfig = {
        ExecStart = "${lib.getExe cfg.package} ${cfg.package}/share/uuplugin/uu.conf";
        StateDirectory = "uuplugin";
        WorkingDirectory = "/var/lib/uuplugin";
        Restart = "always";
        RestartSec = 5;
      };
    };

    networking.firewall = {
      allowedTCPPorts = [
        14554
        16363
      ];
      allowedUDPPorts = [
        14554
        16363
      ];
    };
  };
}
