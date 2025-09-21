{ ... }:
{
  imports = [ ./hyprlock.nix ];
  programs.hyprland = {
    xwayland.enable = true;
    withUWSM = true;
  };
}
