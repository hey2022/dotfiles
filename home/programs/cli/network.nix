{ pkgs, ... }:
{
  home.packages = with pkgs; [
    doggo
    gping
    iperf3
    mtr
    nethogs
    rustscan
    speedtest-go
  ];
}
