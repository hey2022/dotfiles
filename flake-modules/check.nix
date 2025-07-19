{ self, ... }:

{
  perSystem =
    {
      self',
      lib,
      system,
      ...
    }:
    {
      checks =
        let
          CI = builtins.getEnv "CI" != "";
          machinesPerSystem = {
            x86_64-linux = [
              "desktop"
              "goon"
            ];
          };
          nixosMachines = lib.mapAttrs' (n: lib.nameValuePair "nixos-${n}") (
            lib.genAttrs (machinesPerSystem.${system} or [ ]) (
              name: self.nixosConfigurations.${name}.config.system.build.toplevel
            )
          );
          packages = lib.mapAttrs' (n: lib.nameValuePair "package-${n}") self'.packages;
          devShells = lib.mapAttrs' (n: lib.nameValuePair "devShell-${n}") self'.devShells;
          homeConfigurations = lib.mapAttrs' (
            name: config: lib.nameValuePair "home-manager-${name}" config.activation-script
          ) (self'.legacyPackages.homeConfigurations or { });
        in
        nixosMachines // devShells // packages // lib.optionalAttrs (!CI) homeConfigurations;
    };
}
