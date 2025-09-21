{ pkgs, ... }:

{
  home.packages = with pkgs; [
    super-productivity
  ];
}
