{
  config,
  lib,
  pkgs,
  ...
}: {
  services.swaync = {
    enable = true;
    settings = {
      "control-center-margin-top" = 5;
      "control-center-margin-bottom" = 5;
      "control-center-margin-right" = 5;
      "widgets" = [
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
    };
  };
}
