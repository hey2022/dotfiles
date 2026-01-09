{ pkgs, lib, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [ qt6Packages.fcitx5-chinese-addons ];
      waylandFrontend = true;
      # HACK: https://github.com/catppuccin/nix/pull/820
      settings.addons = lib.mkForce { };
    };
  };
  home.sessionVariables = {
    QT_IM_MODULE = "fcitx";
  };
}
