{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    mold
    cmake
    ninja

    clang-tools
    cppcheck
    valgrind
    gdb
  ];
}
