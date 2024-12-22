{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.ydotool;
in {
  options.programs.ydotool = {
    users = mkOption {
      description = "List of users part of programs.ydotool.group";
      type = types.listOf types.str;
    };
  };
  config = mkIf cfg.enable {
    users.groups.${cfg.group}.members = cfg.users;
  };
}
