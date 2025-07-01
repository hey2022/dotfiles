{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  combined = pkgs.symlinkJoin {
    name = "combined-reshade-shaders";
    paths = [
      "${inputs.reshade-shaders}/Shaders"
      ./SweetFX/Shaders
    ];
  };
in
{
  config = lib.mkIf config.profiles.gaming.enable {
    home.file.".local/share/gamescope/reshade/Shaders".source = combined;
  };
}
