{ lib, pkgs, ... }:

{
  home = {
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      VISUAL = "neovide";
      EDITOR = "nvim";

      SHELL = lib.getExe pkgs.fish;
    };
  };
}
