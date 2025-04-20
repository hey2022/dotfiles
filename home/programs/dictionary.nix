{pkgs-stable, ...}: {
  # https://nixpk.gs/pr-tracker.html?pr=399998
  home.packages = [pkgs-stable.goldendict-ng];
}
