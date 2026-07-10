{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.rofi = {
    theme = lib.mkForce {
      "@import" = "theme";
    };
    extraConfig =
      let
        run-prefix = if config.programs.uwsm.enable then "runapp -- " else "";
      in
      {
        modes = "drun,run,recursivebrowser,window";
        show-icons = true;
        display-drun = "  ";
        display-run = "";
        display-recursivebrowser = "";
        display-window = "";
        drun-display-format = "{name}";
        window-format = "{w}{c}";
        run-command = "${run-prefix}{cmd}";
        recursivebrowser = {
          command = "${run-prefix}xdg-open";
        };
      };
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];
  };
  xdg.dataFile."rofi/themes/theme.rasi".source = config.lib.hm.mkFlakeSymlink ./theme.rasi;
}
