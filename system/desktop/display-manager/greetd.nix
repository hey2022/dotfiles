{ lib, pkgs, ... }:

{
  services.greetd.settings = {
    initial_session = {
      command = lib.getExe' pkgs.niri "niri-session";
      user = "yiheng";
    };
  };
}
