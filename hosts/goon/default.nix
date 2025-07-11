{ self, inputs, ... }:

{
  flake.nixosConfigurations.goon = (self.build "x86_64-linux").mkSystem [
    ./configuration.nix
    inputs.disko.nixosModules.default
  ];

  flake.homeConfigurations."yiheng@goon" = (self.build "x86_64-linux").mkHome [
    ./home.nix
  ];
}
