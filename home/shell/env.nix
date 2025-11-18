{ lib, pkgs, ... }:

{
  home = {
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      VISUAL = "neovide";
      EDITOR = "nvim";

      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SHELL = lib.getExe pkgs.fish;
    };
  };
}
