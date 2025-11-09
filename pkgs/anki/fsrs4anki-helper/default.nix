{
  lib,
  anki-utils,
  fetchFromGitHub,
  unstableGitUpdater,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "fsrs4anki-helper";
  version = "24.06.3-unstable-2025-10-24";

  src = fetchFromGitHub {
    owner = "open-spaced-repetition";
    repo = "fsrs4anki-helper";
    rev = "2bd5fb0816885990e73a7e95bf07690c2e47c368";
    hash = "sha256-Vu99QaMb++Umke6ANC83EGPQJSa3rnGCnhBVP/zm7V8=";
    fetchSubmodules = true;
  };

  passthru.updateScript = unstableGitUpdater { tagPrefix = "v"; };

  meta = {
    description = "Anki add-on that supports the FSRS algorithm";
    longDescription = ''
      FSRS Helper is an Anki add-on that supports the FSRS algorithm. It has eight main features:
      - Reschedule cards based on their entire review histories.
      - Postpone a selected number of due cards.
      - Advance a selected number of undue cards.
      - Balance the load during rescheduling (based on fuzz).
      - Less Anki on Easy Days (such as weekends) during rescheduling (based on load balance).
      - Disperse Siblings (cards with the same note) to avoid interference & reminder.
      - Flatten future due cards to a selected number of reviews per day.
      - Steps Stats quantify your short-term memory performance and recommend learning steps.
    '';
    homepage = "https://github.com/open-spaced-repetition/fsrs4anki-helper";
    downloadPage = "https://ankiweb.net/shared/info/759844606";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.all;
  };
})
