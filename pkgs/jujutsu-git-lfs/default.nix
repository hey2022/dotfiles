{
  jujutsu,
  fetchFromGitHub,
  rustPlatform,
}:

# HACK: git-lfs: add ability to ignore files based on git attributes https://github.com/jj-vcs/jj/pull/9635
jujutsu.overrideAttrs rec {
  version = "0.45.1";
  src = fetchFromGitHub {
    owner = "jj-vcs";
    repo = "jj";
    rev = "sbarfurth/push-uulvmqxnpmzk";
    hash = "sha256-DwVfrnUxwIX/9uK7/LDd2jV0ocPVVRnw2ByCaEKOahg=";
  };
  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-1pTeIJ1xwjeL5nzD4JNq/5mwyzee9Jh1pZfXc17C+6w=";
  };
}
