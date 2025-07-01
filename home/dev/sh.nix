{ pkgs, ... }:
{
  home.packages = with pkgs; [
    shfmt
    shellcheck
    bash-language-server
  ];
}
