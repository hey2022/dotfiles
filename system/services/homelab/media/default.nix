{ config, lib, ... }:

{
  imports = [
    ./bazarr.nix
    ./jellyfin.nix
    ./jellyseer.nix
    ./navidrome.nix
    ./qbittorrent.nix
    ./suwayomi.nix
    ./torrent
  ];
  users.groups.media = { };

  system.activationScripts.createMediaDirs =
    let
      mediaDirs = [
        "shows/anime"
        "shows/other"
        "movies/anime"
        "movies/other"
        "music"
        "downloads"
      ];
    in
    ''
      if mountpoint -q ${config.homelab.mediaDir}; then
        ${lib.concatLines (
          map (dir: ''
            mkdir -p ${config.homelab.mediaDir}/${dir}
            chown root:media ${config.homelab.mediaDir}/${dir}
            chmod 775 ${config.homelab.mediaDir}/${dir}
          '') mediaDirs
        )}
      fi
    '';
}
