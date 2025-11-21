{ callPackage, ... }:

{
  ajt-card-management = callPackage ./ajt-card-management { };
  anki-contanki = callPackage ./anki-contanki { };
  anki-stylusdraw = callPackage ./anki-stylusdraw { };
  anki-to-pdf = callPackage ./anki-to-pdf { };
  anking-notes-addon = callPackage ./anking-notes-addon { };
  fsrs4anki-helper = callPackage ./fsrs4anki-helper { };
  mds-time-left = callPackage ./mds-time-left { };
  popup-dictionary = callPackage ./popup-dictionary { };
  remaining-time = callPackage ./remaining-time { };
  search-stats-extended = callPackage ./search-stats-extended { };
  search-stats-extended-bin = callPackage ./search-stats-extended-bin { };
}
