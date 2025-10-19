{ self, inputs, ... }:
{
  perSystem =
    { system, ... }:

    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = import ../common/nixpkgs.nix;
      };
      nixCats = import "${self}/common/nvim" { inherit inputs; };
    in
    {
      packages = {
        default = nixCats.packages.${system}.nvim;
        nvim = nixCats.packages.${system}.nvim;
        nnvim = nixCats.packages.${system}.nnvim;
        cliprust = pkgs.callPackage ./cliprust { };
        neovim-anywhere = pkgs.callPackage ./neovim-anywhere { };
        ticktick-cracked = pkgs.callPackage ./ticktick-cracked { };
        anki-popup-dictionary = pkgs.callPackage ./anki/popup-dictionary { };
        anki-fsrs-helper = pkgs.callPackage ./anki/fsrs-helper { };
        ajt-card-management = pkgs.callPackage ./anki/ajt-card-management { };
        anki-contanki = pkgs.callPackage ./anki/anki-contanki { };
        anki-hyper-tts = pkgs.callPackage ./anki/anki-hyper-tts { };
        anki-stylusdraw = pkgs.callPackage ./anki/anki-stylusdraw { };
        anking-note-addon = pkgs.callPackage ./anki/anking-note-addon { };
        mds-time-left = pkgs.callPackage ./anki/mds-time-left { };
        anki-life-drain = pkgs.callPackage ./anki/life-drain { };
        gitbutler-bin = pkgs.callPackage ./gitbutler-bin { };
        # anki-search-stats-extended = pkgs.callPackage ./anki/search-stats-extended { };
      };
    };
}
