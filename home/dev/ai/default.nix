{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.profiles.dev;

  flatten =
    dir:
    lib.genAttrs (lib.filter (name: builtins.pathExists "${toString dir}/${name}/SKILL.md") (
      builtins.attrNames (builtins.readDir dir)
    )) (name: dir + "/${name}");

  skills = {
    humanizer = "${inputs.humanizer}";
  }
  // flatten "${inputs.janestreet-agent-skills}"
  // flatten "${inputs.ponytail-agent-skills}/skills"
  // lib.mapAttrs (_: config.lib.hm.mkFlakeSymlink) (flatten ./skills);
in
{
  imports = [
    ./mcp.nix
  ];
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ deepseek-harness ];
    programs = {
      claude-code.enable = true;
      codex.enable = true;
      opencode.enable = true;
      t3code.enable = true;
      mcp.enable = true;
    };
    home.file = lib.mkMerge [
      (lib.mapAttrs' (
        name: source: lib.nameValuePair ".agents/skills/${name}" { inherit source; }
      ) skills)
      (lib.mapAttrs' (
        name: source:
        lib.nameValuePair "${config.programs.claude-code.configDir}/skills/${name}" { inherit source; }
      ) skills)
      { ".agents/AGENTS.md".source = ./AGENTS.md; }
    ];
  };
}
