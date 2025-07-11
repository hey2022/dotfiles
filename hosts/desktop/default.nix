{ self, ... }:

{
  flake.nixosConfigurations.desktop = (self.build "x86_64-linux").mkSystem [
    ./configuration.nix
  ];

  flake.homeConfigurations."yiheng@desktop" = (self.build "x86_64-linux").mkHome [
    ./home.nix
  ];
}
