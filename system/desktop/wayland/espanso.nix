{ pkgs, ... }:

{
  services.espanso = {
    package = pkgs.espanso-wayland;
    extraPackages = with pkgs; [
      bash
      python3
      curl
    ];
  };
}
