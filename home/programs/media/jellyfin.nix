{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.profiles.entertainment.enable {
    # HACK: Drop jellyfin-media-player for now https://github.com/nixos/nixpkgs/issues/437865
    home.packages = with pkgs; [
      # jellyfin-media-player
    ];
  };
}
