{ pkgs, ... }:

{
  services.espanso = {
    package = pkgs.espanso-wayland;
  };
}
