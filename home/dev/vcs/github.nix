{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
  home.packages = with pkgs; [
    zizmor
  ];
}
