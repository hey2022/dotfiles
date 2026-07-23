{
  writeShellApplication,
  coreutils,
  foot,
  neovim,
  wl-clipboard,
  ydotool,
}:

writeShellApplication {
  name = "neovim-anywhere";
  runtimeInputs = [
    coreutils
    foot
    neovim
    wl-clipboard
    ydotool
  ];
  text = builtins.readFile ./neovim-anywhere.sh;
}
