{ callPackage, ... }:

{
  popup-dictionary = callPackage ./popup-dictionary { };
  fsrs4anki-helper = callPackage ./fsrs4anki-helper { };
  ajt-card-management = callPackage ./ajt-card-management { };
  anki-contanki = callPackage ./anki-contanki { };
  anki-stylusdraw = callPackage ./anki-stylusdraw { };
  anking-notes-addon = callPackage ./anking-notes-addon { };
  mds-time-left = callPackage ./mds-time-left { };
  search-stats-extended = callPackage ./search-stats-extended { };
}
