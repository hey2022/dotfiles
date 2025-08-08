{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        cliprust = pkgs.callPackage ./cliprust { };
        maxent = pkgs.callPackage ./maxent { };
      };
    };
}
