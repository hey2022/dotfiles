{ pkgs-local, ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts."http://localhost:8888".extraConfig = ''
      redir / /web/viewer.html

      handle_path /pdf/* {
        root * /run/caddy
        file_server
      }

      handle {
        root * ${pkgs-local.pdf-js}
        file_server
        encode gzip zstd
      }
    '';
  };
  systemd.services.caddy.serviceConfig = {
    RuntimeDirectory = "caddy";
    RuntimeDirectoryMode = "0770";
  };
}
