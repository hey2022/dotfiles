{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.swaync = {
    enable = true;
    settings = {
      "widgets" = [
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
    };
  };
}
