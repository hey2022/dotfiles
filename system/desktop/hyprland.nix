{ ... }:
{
  imports = [ ./hyprlock.nix ];
  programs.hyprland = {
    xwayland.enable = true;
    withUWSM = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
