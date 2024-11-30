{pkgs, ...}: {
  home.packages = with pkgs; [
    doggo
    mtr
    rustscan
    iperf3
  ];
}
