{
  self,
  inputs,
  config,
  ...
}:

{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];
  sops = {
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    defaultSopsFile = "${self}/secrets/home/secrets.yaml";
  };
}
