{ self, inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:

    let
      nixCats = import "${self}/common/nvim" { inherit inputs; };
    in
    {
      packages = {
        nvim = nixCats.packages.${system}.nvim;
        nnvim = nixCats.packages.${system}.nnvim;
        cliprust = pkgs.callPackage ./cliprust { };
      };
    };
}
