{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.services.cliphist.enable {
    home.packages = with pkgs; [
      cliprust
    ];
    services.cliphist = {
      package = pkgs.cliprust;
      extraOptions = [ ];
    };
  };
}
