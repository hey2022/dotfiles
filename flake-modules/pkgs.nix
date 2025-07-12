{
  perSystem =
    { pkgs, ... }:
    {
      packages.cliprust = pkgs.callPackage ../pkgs/cliprust { };
    };
}
