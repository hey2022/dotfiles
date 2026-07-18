{ pkgs, ... }:
{
  programs.steam = {
    protontricks.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
