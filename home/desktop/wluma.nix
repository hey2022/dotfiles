{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.wluma;
in {
  options.services.wluma = {
    enable = mkEnableOption "Automatic brightness adjustment based on screen contents and ALS";

    settings = mkOption {
      type = types.attrs;
      default = {};
      description = ''
        Configuration for wluma, in Nix format.
        Will be converted to TOML syntax.
        See https://github.com/maximbaz/wluma for configuration options.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.wluma];

    xdg.configFile."wluma/config.toml".source = pkgs.writers.writeTOML "wluma-config" cfg.settings;

    systemd.user.services.wluma = {
      Unit = {
        Description = "Adjusting screen brightness based on screen contents and amount of ambient light";
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
      Service = {
        ExecStart = "${pkgs.wluma}/bin/wluma";
        Restart = "always";
        EnvironmentFile = "-%E/wluma/service.conf";
        PrivateNetwork = true;
        PrivateMounts = false;
      };
    };
  };
}
