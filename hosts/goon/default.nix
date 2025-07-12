{ self, inputs, ... }:

{
  flake.nixosConfigurations.goon = (self.lib.build "x86_64-linux").mkSystem [
    ./configuration.nix
    inputs.disko.nixosModules.default
  ];

  flake.homeConfigurations."yiheng@goon" = (self.lib.build "x86_64-linux").mkHome [
    ./home.nix
  ];
}
