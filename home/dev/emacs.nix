  home.packages = with pkgs; [
    git
    emacs
    ripgrep
    fd
  ];
  services.emacs = {
    enable = true;
    startWithUserSession = true;
  };
{pkgs, ...}: {
  home.file = {
    ".config/doom" = {
      source = ../../.config/doom;
      recursive = true;
    };
  };
}
