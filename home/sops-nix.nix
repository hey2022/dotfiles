{ inputs, config, ... }:

{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.age-key.txt";
  };
}
