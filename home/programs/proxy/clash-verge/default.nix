{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clash-verge-rev
  ];
  # HACK: tun mode does not work
  xdg.configFile."uwsm/env".text = ''
    export https_proxy=http://127.0.0.1:7897
    export http_proxy=http://127.0.0.1:7897
  '';
  systemd.user.services.hydroxide.Service.Environment = [
    "export https_proxy=http://127.0.0.1:7897"
    "export http_proxy=http://127.0.0.1:7897"
  ];

}
