{ config, lib, ... }:

let
  cfg = config.programs.fish;
in

{
  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      fish_greeting = "";
    };
    programs.fish = {
      preferAbbrs = true;
      interactiveShellInit = ''
        fish_vi_key_bindings
      '';
      shellAliases = {
        ls = "eza";
        cat = "bat -p";
      };
    };
  };
}
