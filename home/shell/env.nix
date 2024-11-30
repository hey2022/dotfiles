{
  config,
  lib,
  pkgs,
  ...
}: {
  home = {
    sessionPath = [
      "$HOME/.config/emacs/bin"
      "$HOME/.cargo/bin"
    ];
    sessionVariables = {
      ALTERNATE_EDITOR = "";
      VISUAL = "emacsclient -c";
      EDITOR = "emacsclient -nw";
      QT_QPA_PLATFORMTHEME = "qt5ct";

      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };
}
