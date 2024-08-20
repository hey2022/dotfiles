{
	description = "NixOS flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		homemanager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {nixpkgs, home-manager, ... }:
	let
		system = "x86_64-linux";
	in {
		nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [
				./nixos/hosts/desktop/configuration.nix
			];
		};
		homeConfigurations.yiheng = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home-manager/home.nix ];
		};
	};
}
