{ self, inputs, ... }:

{
  flake.nixosConfigurations.goon = (self.flake-utils "x86_64-linux").mkNixosSystem [
    ./configuration.nix
    inputs.disko.nixosModules.default
  ];

  flake.homeConfigurations."yiheng@goon" = (self.flake-utils "x86_64-linux").mkHomeConfig [
    ./home.nix
  ];
}
