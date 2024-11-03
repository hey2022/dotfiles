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
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket";
      QT_QPA_PLATFORMTHEME = "qt5ct";

      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };
}
