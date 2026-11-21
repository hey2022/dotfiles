{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.opencode;
in
{
  config = lib.mkIf cfg.enable {
    programs.opencode = {
      enableMcpIntegration = true;
      extraPackages = with pkgs; [ nodejs ];
      settings = {
        default_agent = "plan";
        plugins = [
          "@slkiser/opencode-quota"
        ];
      };
    };
    xdg.configFile."opencode/AGENTS.md".source = config.lib.hm.mkFlakeSymlink ../dev/ai/AGENTS.md;
  };
}
