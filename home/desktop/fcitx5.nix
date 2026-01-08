{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [ qt6Packages.fcitx5-chinese-addons ];
      waylandFrontend = true;
    };
  };
  home.sessionVariables = {
    QT_IM_MODULE = "fcitx";
  };
}
