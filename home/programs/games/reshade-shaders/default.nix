{
  inputs,
  pkgs,
  ...
}: let
  combined = pkgs.symlinkJoin {
    name = "combined-reshade-shaders";
    paths = [
      "${inputs.reshade-shaders}/Shaders"
      ./SweetFX/Shaders
    ];
  };
in {
  home.file.".local/share/gamescope/reshade/Shaders".source = combined;
}
