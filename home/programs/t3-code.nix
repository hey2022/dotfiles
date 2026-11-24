{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.programs.t3code;
in
{
  config = lib.mkIf cfg.enable {
    programs.t3code = {
      server = {
        enable = true;
        extraArgs = [
          "--host"
          "0.0.0.0"
        ];
      };
      userSettings.providerInstances.deepseek = {
        driver = "acpRegistry";
        displayName = "DeepSeek Harness";
        config = {
          source = "local";
          commandPath = lib.getExe pkgs.deepseek-harness;
          commandArgs = [
            "--profile"
            "acp"
          ];
        };
      };
    };
    home.sessionVariables = {
      # HACK: until https://nixpkgs-tracker.ocfox.me/?pr=592653 lands
      T3CODE_TELEMETRY_ENABLED = false;
    };
  };
}
