{pkgs, ...}: {
  home.packages = with pkgs; [
    hunspell

    hunspellDicts.en-gb-ize
    hunspellDicts.en-us
  ];
}
