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
    hash = "sha256-RH95COZILuOA4IWjJBRtiMzEB4tragTPTXUfmCFzSTg=";
  };
  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-WZZ0KQkKWEJSDeCeQ4SmFyj6eacoEU9YLeBVjRSlSNI=";
  };
}
