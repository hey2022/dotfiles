{ config, lib, ... }:

let
  cfg = config.programs.codex;
in
{
  config = lib.mkIf cfg.enable {
    programs.codex = {
      enableMcpIntegration = true;
    };
    home.file.".codex/AGENTS.md".source = config.lib.hm.mkFlakeSymlink ../dev/ai/AGENTS.md;
  };
}
