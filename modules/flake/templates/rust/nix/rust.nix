{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    let
      craneLib = inputs.crane.mkLib pkgs;
      src = craneLib.cleanCargoSource ../.;
      commonArgs = {
        inherit src;
        strictDeps = true;
      };
      cargoArtifacts = craneLib.buildDepsOnly commonArgs;
    in
    {
      packages.default = craneLib.buildPackage (
        commonArgs
        // {
          doCheck = false;
          inherit cargoArtifacts;
        }
      );
      checks = {
        clippy = craneLib.cargoClippy (
          commonArgs
          // {
            inherit cargoArtifacts;
            cargoClippyExtraArgs = "--all-targets -- --deny warnings";
          }
        );
        nextest = craneLib.cargoNextest (
          commonArgs
          // {
            inherit cargoArtifacts;
            partitions = 1;
            partitionType = "count";
            cargoNextestPartitionsExtraArgs = "--no-tests=pass";
          }
        );
      };
    };
}
