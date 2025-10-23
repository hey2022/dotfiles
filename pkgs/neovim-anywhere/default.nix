{
  writeShellApplication,
  neovide,
  wl-clipboard,
  coreutils,
  ydotool,
}:

writeShellApplication {
  name = "neovim-anywhere";
  runtimeInputs = [
    coreutils
    neovide
    wl-clipboard
    ydotool
  ];
  text = builtins.readFile ./neovim-anywhere.sh;
}
