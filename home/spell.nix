{pkgs, ...}: {
  home.packages = with pkgs; [
    enchant
    nuspell
    hunspellDicts.en-gb-ize
    hunspellDicts.en-us
  ];
}
