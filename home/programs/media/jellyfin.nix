{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.profiles.entertainment.enable {
    home.packages = with pkgs; [ jellyfin-media-player ];
    # HACK: https://github.com/nixos/nixpkgs/issues/437865
    nixpkgs.config.permittedInsecurePackages = [
      "qtwebengine-5.15.19"
    ];
  };
}
