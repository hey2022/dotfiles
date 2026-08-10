{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mold
    ninja
  ];
  home.file.".conan2/profiles/default".source = ./conan-profile;
}
