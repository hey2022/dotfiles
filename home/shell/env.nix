{...}: {
  home = {
    sessionPath = [
      "$HOME/.config/emacs/bin"
      "$HOME/.cargo/bin"
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      VISUAL = "emacsclient -c";
      EDITOR = "emacsclient -nw";
      QT_QPA_PLATFORMTHEME = "qt5ct";

      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };
}
