{
  writeShellApplication,
  aria2,
  coreutils,
  curl,
  ripgrep,
  sd,
}:

writeShellApplication {
  name = "ap-dl";
  runtimeInputs = [
    aria2
    coreutils
    curl
    ripgrep
    sd
  ];
  text = builtins.readFile ./ap-dl.sh;
}
