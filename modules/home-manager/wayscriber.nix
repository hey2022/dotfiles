{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.wayscriber;
  format = pkgs.formats.toml { };
in
{
  meta.maintainers = with lib.maintainers; [ hey2022 ];

  options.services.wayscriber = {
    enable = lib.mkEnableOption "Wayscriber - Screen annotation tool for Wayland";
    package = lib.mkPackageOption pkgs "wayscriber" { };
    extraPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        wl-clipboard
        grim
        slurp
      ];
      example = lib.literalExpression "with pkgs; [ wl-clipboard grim slurp ];";
      description = "Extra packages for wayscriber helper tools.";
    };
    extraArgs = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [
        "--no-tray"
      ];
      description = ''
        Options given to wayscriber when the service is run.
      '';
    };
    settings = lib.mkOption {
      type = format.type;
      default = { };
      example = {
        tablet = {
          enabled = true;
        };
      };
      description = ''
        Configuration to use for wayscriber.
        See <https://github.com/devmobasa/wayscriber/blob/main/config.example.toml> for available options.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "services.wayscriber" pkgs lib.platforms.linux)
    ];

    home.packages = [ cfg.package ];

    xdg.configFile."wayscriber/config.toml" = lib.mkIf (cfg.settings != { }) {
      source = format.generate "config.toml" cfg.settings;
    };

    systemd.user.services.wayscriber = {
      Install = {
        WantedBy = [ config.wayland.systemd.target ];
      };

      Unit = {
        Description = "Wayscriber daemon";
        After = [ config.wayland.systemd.target ];
        PartOf = [ config.wayland.systemd.target ];
      };

      Service = {
        Type = "simple";
        ExecStartPre = ''${pkgs.runtimeShell} -c '[ -n "$WAYLAND_DISPLAY" ] && [ -S "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY" ]' '';
        ExecStart = lib.escapeShellArgs (
          [
            (lib.getExe cfg.package)
            "--daemon"
          ]
          ++ cfg.extraArgs
        );
        Restart = "on-failure";
        RestartSec = 5;
        RestartPreventExitStatus = 75;
        SuccessExitStatus = 75;
        Environment = [
          "PATH=${lib.makeBinPath cfg.extraPackages}"
        ];
      };
    };
  };
}
