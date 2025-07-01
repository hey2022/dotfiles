{ pkgs, ... }:
let
  beetsSettings = import ../../../../../common/beets.nix;
  beetsImport = pkgs.writeScriptBin "beets-import.sh" ''
    #!${pkgs.bash}/bin/bash

    if [[ "$lidarr_eventtype" = "Test" ]]; then
        ${pkgs.beets}/bin/beet version
        exit 0
    fi

    ${pkgs.beets}/bin/beet import -q "$lidarr_artist_path"
  '';
in
{
  environment.etc."beets/config.yaml".source =
    (pkgs.formats.yaml { }).generate "config.yaml"
      beetsSettings;
  system.activationScripts.beetsImport = ''
    mkdir -p /var/lib/lidarr/.config/Lidarr
    cp ${beetsImport}/bin/beets-import.sh /var/lib/lidarr/.config/Lidarr/beets-import.sh
  '';
}
