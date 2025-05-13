{pkgs, ...}: {
  programs.steam = {
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    protontricks.enable = true;
    gamescopeSession = {
      enable = true;
    };
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
