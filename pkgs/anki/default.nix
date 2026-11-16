{ callPackage, ... }:

{
  ajt-autocopy = callPackage ./ajt-autocopy { };
  anki-stylusdraw = callPackage ./anki-stylusdraw { };
  anking-notes-addon = callPackage ./anking-notes-addon { };
  empty-cards-shortcut = callPackage ./empty-cards-shortcut { };
  mds-time-left = callPackage ./mds-time-left { };
  search-stats-extended = callPackage ./search-stats-extended { };
  search-stats-extended-bin = callPackage ./search-stats-extended-bin { };
}
