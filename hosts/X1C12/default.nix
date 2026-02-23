{ self, ... }:

{
  flake.nixosConfigurations.X1C12 = (self.lib.build "x86_64-linux").mkSystem [
    ./configuration.nix
  ];

  flake.homeConfigurations."yiheng@X1C12" = (self.lib.build "x86_64-linux").mkHome [
    ./home.nix
  ];
}
