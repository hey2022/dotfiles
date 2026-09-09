{
  symlinkJoin,
  writeShellApplication,
  makeDesktopItem,
  coreutils,
  firefox,
}:

let
  script = writeShellApplication {
    name = "pdf-open";
    runtimeInputs = [
      coreutils
      firefox
    ];
    text = builtins.readFile ./pdf-open.sh;
  };

  desktopItem = makeDesktopItem {
    name = "pdf-open";
    desktopName = "pdf.js Opener";
    exec = "${script}/bin/pdf-open %f";
    mimeTypes = [ "application/pdf" ];
    categories = [ "Utility" ];
    extraConfig = {
      NoDisplay = "true";
    };
  };
in

symlinkJoin {
  name = "pdf-open";
  paths = [
    script
    desktopItem
  ];
}
