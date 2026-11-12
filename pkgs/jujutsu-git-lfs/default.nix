{
  jujutsu,
  fetchFromGitHub,
  rustPlatform,
}:

# HACK: git-lfs: add ability to ignore files based on git attributes https://github.com/jj-vcs/jj/pull/9635
jujutsu.overrideAttrs rec {
  version = "0.47.1";
  src = fetchFromGitHub {
    owner = "jj-vcs";
    repo = "jj";
    rev = "sbarfurth/push-uulvmqxnpmzk";
    hash = "sha256-wXrzUSNbiaKcgSx/mBtaLXE8g774x17FzESg0On/Swc=";
  };
  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-MeYpBSwEX5pwlgJffXPhKSQufEWb9vqWaEnn4ehCp9I=";
  };
}
