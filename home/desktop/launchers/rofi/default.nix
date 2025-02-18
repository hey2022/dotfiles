{
  inputs,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  xdg.configFile."rofi".source = "${inputs.rofi-themes}/files";
}
