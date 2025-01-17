{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.plymouth = {
    enable = true;
    theme = "lone";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        selected_themes = ["lone"];
      })
    ];
  };
  stylix.targets.plymouth.enable = lib.mkIf config.boot.plymouth.enable false;
}
