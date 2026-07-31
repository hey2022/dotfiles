{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastmod
    openssl
  ];
}
