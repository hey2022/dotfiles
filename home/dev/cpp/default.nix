{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (lib.hiPrio clang)
    clang-tools
    cmake
    conan
    cppcheck
    gcc
    mold
    ninja
    vcpkg
  ];
  home.file.".conan2/profiles/default".source = ./conan-profile;
}
