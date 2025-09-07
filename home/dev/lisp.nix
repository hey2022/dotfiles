{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.profiles.dev.lisp;
in
{
  options.profiles.dev.lisp.enable = lib.mkEnableOption "lisp dev profile";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      sbcl
      rlwrap
    ];
  };
}
