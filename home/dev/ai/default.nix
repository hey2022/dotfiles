{
  inputs,
  config,
  lib,
  ...
}:

let
  cfg = config.profiles.dev;
in
{
  imports = [
    ./mcp.nix
  ];
  config = lib.mkIf cfg.enable {
    programs = {
      opencode.enable = true;
      mcp.enable = true;
    };
    home.file = {
      ".agents/skills/janestreet".source = inputs.janestreet-agent-skills;
      ".agents/skills/personal".source = config.lib.hm.mkFlakeSymlink ./skills;
    };
  };
}
