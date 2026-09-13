{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.skwd-deck;
in
{
  options.services.skwd-deck = {
    enable = lib.mkEnableOption "Skwd Deck user service";
    extraPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "Optional Deck backends such as skwd-deck-steamworks.";
    };
    modelPackage = lib.mkOption {
      type = lib.types.package;
      default = inputs.skwd-wall.packages.${pkgs.stdenv.hostPlatform.system}.skwd-lens-model;
      description = "Semantic model pack used by Skwd Lens. The default SigLIP 2 pack is installed with the suite.";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.skwd-wall.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]
    ++ cfg.extraPackages;
    home.sessionVariables = {
      SKWD_LENS_HOME = "${cfg.modelPackage}/share/skwd-lens/models/semantic";
    };
    systemd.user.services.skwd-walld = {
      Unit = {
        Description = "skwd-wall control daemon";
        Documentation = "https://github.com/liixini/skwd-daemon";
        PartOf = [ config.wayland.systemd.target ];
        After = [ config.wayland.systemd.target ];
      };
      Install = {
        WantedBy = [ config.wayland.systemd.target ];
      };
      Service = {
        Type = "simple";
        ExecStart =
          lib.getExe' inputs.skwd-wall.packages.${pkgs.stdenv.hostPlatform.system}.deck
            "skwd-walld";
        Restart = "on-failure";
        Environment = [
          "SKWD_LENS_HOME=${cfg.modelPackage}/share/skwd-lens/models/semantic"
          "PATH=$PATH:${
            lib.makeBinPath (
              [
                inputs.skwd-wall.packages.${pkgs.stdenv.hostPlatform.system}.paper
                inputs.skwd-wall.packages.${pkgs.stdenv.hostPlatform.system}.lens
              ]
              ++ cfg.extraPackages
            )
          }"
        ];
      };
    };
  };
}
