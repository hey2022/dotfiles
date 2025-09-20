{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.home-manager.autoUpgrade;
in
{
  options.services.home-manager.autoUpgrade = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to periodically upgrade Home Manger to the latest
        version. If enabled, a systemd timer will run
        `nixos-rebuild switch --upgrade` once a
        day.
      '';
    };

    flake = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      example = "github:kloenk/nix";
      description = ''
        The Flake URI of the Home Manager configuration to build.
        Disables the option {option}`system.autoUpgrade.channel`.
      '';
    };

    channel = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      example = "https://nixos.org/channels/nixos-14.12-small";
      description = ''
        The URI of the Home Manager channel to use for automatic
        upgrades. By default, this is the channel set using
        {command}`nix-channel` (run `nix-channel --list`
        to see the current value).
      '';
    };

    upgrade = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Disable adding the `--upgrade` parameter when `channel`
        is not set, such as when upgrading to the latest version
        of a flake honouring its lockfile.
      '';
    };

    flags = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [
        "-I"
        "stuff=/home/alice/nixos-stuff"
        "--option"
        "extra-binary-caches"
        "http://my-cache.example.org/"
      ];
      description = ''
        Any additional flags passed to {command}`nixos-rebuild`.

        If you are using flakes and use a local repo you can add
        {command}`[ "--update-input" "nixpkgs" "--commit-lock-file" ]`
        to update nixpkgs.
      '';
    };

    frequency = lib.mkOption {
      type = lib.types.str;
      default = "04:40";
      example = "daily";
      description = ''
        How often or when upgrade occurs. For most desktop and server systems
        a sufficient upgrade frequency is once a day.

        The format is described in
        {manpage}`systemd.time(7)`.
      '';
    };

    randomizedDelaySec = lib.mkOption {
      default = "0";
      type = lib.types.str;
      example = "45min";
      description = ''
        Add a randomized delay before each automatic upgrade.
        The delay will be chosen between zero and this value.
        This value must be a time span in the format specified by
        {manpage}`systemd.time(7)`
      '';
    };

    fixedRandomDelay = lib.mkOption {
      default = false;
      type = lib.types.bool;
      example = true;
      description = ''
        Make the randomized delay consistent between runs.
        This reduces the jitter between automatic upgrades.
        See {option}`randomizedDelaySec` for configuring the randomized delay.
      '';
    };

    persistent = lib.mkOption {
      default = true;
      type = lib.types.bool;
      example = false;
      description = ''
        Takes a boolean argument. If true, the time when the service
        unit was last triggered is stored on disk. When the timer is
        activated, the service unit is triggered immediately if it
        would have been triggered at least once during the time when
        the timer was inactive. Such triggering is nonetheless
        subject to the delay imposed by RandomizedDelaySec=. This is
        useful to catch up on missed runs of the service when the
        system was powered down.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "services.home-manager.autoUpgrade" pkgs lib.platforms.linux)
      {
        assertion = !((cfg.channel != null) && (cfg.flake != null));
        message = ''
          The options 'services.home-manager.autoUpgrade.channel' and 'services.home-manager.autoUpgrade.flake' cannot both be set.
        '';
      }
    ];

    services.home-manager.autoUpgrade.flags =
      if cfg.flake == null then
        [ "--no-build-output" ]
        ++ lib.optionals (cfg.channel != null) [
          "-I"
          "nixpkgs=${cfg.channel}/nixexprs.tar.xz"
        ]
      else
        [
          "--refresh"
          "--flake ${cfg.flake}"
        ];

    systemd.user = {
      services.home-manager-upgrade = {
        Unit = {
          Description = "Home Manager Upgrade";

          Wants = "network-online.target";
          After = "network-online.target";

          X-StopOnRemoval = false;
        };

        Service = {
          Type = "oneshot";

          ExecStart =
            let
              home-manager = "${pkgs.home-manager}/bin/home-manager";
              nix-channel = "${pkgs.nix}/bin/nix-channel";
              scriptPath = pkgs.writeShellScript "home-manager-upgrade-start" (
                lib.concatLines (
                  [ "set -e" ]
                  ++ (lib.optional (cfg.channel == null && cfg.upgrade) "${nix-channel} --update")
                  ++ [ "${home-manager} switch ${toString cfg.flags}" ]
                )
              );
            in
            toString scriptPath;

          X-RestartIfChanged = false;
        };
      };

      timers.home-manager-upgrade = {
        Unit.Description = "Home Manager Upgrade";

        Install.WantedBy = [ "timers.target" ];

        Timer = {
          FixedRandomDelay = cfg.fixedRandomDelay;
          OnCalendar = cfg.frequency;
          Persistent = cfg.persistent;
          RandomizedDelaySec = cfg.randomizedDelaySec;
        };
      };
    };
  };
}
