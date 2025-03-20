{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter
    nerd-fonts.symbols-only
  ];
}
