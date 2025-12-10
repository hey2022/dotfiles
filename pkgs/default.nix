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
        ap-dl = pkgs.callPackage ./ap-dl { };
        cliprust = pkgs.callPackage ./cliprust { };
        neovim-anywhere = pkgs.callPackage ./neovim-anywhere { };
        ticktick-cracked = pkgs.callPackage ./ticktick-cracked { };
        gitbutler-bin = pkgs.callPackage ./gitbutler-bin { };
      }
      // (import ./anki { inherit (pkgs) callPackage; });
    };
}
