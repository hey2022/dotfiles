{pkgs, ...}: {
  home.packages = with pkgs; [
    feishin
    songrec
    spotube
    yt-dlp
  ];
}
