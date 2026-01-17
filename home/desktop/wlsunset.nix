{ pkgs, ... }:

{
  # HACK: https://github.com/nix-community/home-manager/pull/8584
  home.packages = [ pkgs.wlsunset ];
  services.wlsunset = {
    # Coordinate precision https://xkcd.com/2170/
    latitude = 23.0;
    longitude = 113.8;
  };
}
