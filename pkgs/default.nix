{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        cliprust = pkgs.callPackage ./cliprust { };
      };
    };
}
