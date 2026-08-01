{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.skwd-wall;
  skwd = inputs.skwd-wall.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  options.programs.skwd-wall = {
    enable = lib.mkEnableOption "skwd-wall";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ skwd ];
    systemd.user.services.skwd-daemon = {
      Unit = {
        Description = "Skwd Daemon";
        Documentation = "https://github.com/liixini/skwd-daemon";
        PartOf = [ config.wayland.systemd.target ];
        After = [ config.wayland.systemd.target ];
      };
      Service = {
        Type = "simple";
        ExecStart = lib.getExe' skwd "skwd-daemon";
        Restart = "on-failure";
        RestartSec = 2;
        Environment = [ "RUST_LOG=info" ];
      };
      Install = {
        WantedBy = [ config.wayland.systemd.target ];
      };
    };
    xdg.configFile."skwd-wall/config.json".source = config.lib.hm.mkFlakeSymlink ./config.json;
  };
}
