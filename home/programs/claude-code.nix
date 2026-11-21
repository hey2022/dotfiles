{ config, lib, ... }:

let
  cfg = config.programs.claude-code;
in
{
  config = lib.mkIf cfg.enable {
    programs.claude-code = {
      enableMcpIntegration = true;
    };
    home.file."${cfg.configDir}/CLAUDE.md".source = config.lib.hm.mkFlakeSymlink ../dev/ai/AGENTS.md;
  };
}
