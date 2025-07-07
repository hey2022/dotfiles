{ inputs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  sops.secrets = {
    nix-access-tokens = {
      sopsFile = "${inputs.self}/secrets/nix-access-tokens";
      format = "binary";
    };
  };
}
