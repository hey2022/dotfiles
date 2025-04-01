{pkgs, ...}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [fcitx5-chinese-addons];
      waylandFrontend = true;
    };
  };
  home.sessionVariables = {
    SDL_IM_MODULE = "fcitx"; # IME support in wechat
  };
}
