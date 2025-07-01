{ ... }:
{
  services.swaync = {
    settings = {
      "control-center-margin-top" = 5;
      "control-center-margin-bottom" = 5;
      "control-center-margin-right" = 5;
      "fit-to-screen" = false;
      "widgets" = [
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
    };
  };
}
