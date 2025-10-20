{ callPackage, ... }:

{
  popup-dictionary = callPackage ./popup-dictionary { };
  fsrs-helper = callPackage ./fsrs-helper { };
  ajt-card-management = callPackage ./ajt-card-management { };
  anki-contanki = callPackage ./anki-contanki { };
  anki-hyper-tts = callPackage ./anki-hyper-tts { };
  anki-stylusdraw = callPackage ./anki-stylusdraw { };
  anking-notes-addon = callPackage ./anking-notes-addon { };
  mds-time-left = callPackage ./mds-time-left { };
  life-drain = callPackage ./life-drain { };
  search-stats-extended = callPackage ./search-stats-extended { };
}
