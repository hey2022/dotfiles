{ self, ... }:

{
  flake.nixosConfigurations.desktop = (self.lib.build "x86_64-linux").mkSystem [
    ./configuration.nix
  ];

  flake.homeConfigurations."yiheng@desktop" = (self.lib.build "x86_64-linux").mkHome [
    ./home.nix
  ];
}
