{ self, ... }:

{
  flake.nixosConfigurations.desktop = (self.flake-utils "x86_64-linux").mkNixosSystem [
    ./configuration.nix
  ];

  flake.homeConfigurations."yiheng@desktop" = (self.flake-utils "x86_64-linux").mkHomeConfig [
    ./home.nix
  ];
}
