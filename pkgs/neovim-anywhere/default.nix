{
  writeShellApplication,
  neovide,
  wl-clipboard,
  coreutils,
}:

writeShellApplication {
  name = "neovim-anywhere";
  runtimeInputs = [
    neovide
    wl-clipboard
    coreutils
  ];
  text = builtins.readFile ./neovim-anywhere.sh;
}
