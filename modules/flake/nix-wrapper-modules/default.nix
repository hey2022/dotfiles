{ self, inputs, ... }:
{
  imports = [ inputs.wrappers.flakeModules.wrappers ];
  flake.wrappers = {
    nvim = inputs.nixpkgs.lib.modules.importApply ./nvim/module.nix inputs;
    nvim-unwrapped = {
      imports = [ self.wrapperModules.nvim ];
      settings.wrap = false;
    };
  };
}
