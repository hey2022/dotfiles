{ inputs, ... }:
{
  imports = [ inputs.catppuccin.nixosModules.catppuccin ];
  catppuccin = {
    enable = true;
    autoEnable = true;
    cache.enable = true;
    flavor = "mocha";
  };
}
