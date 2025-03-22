{...}: {
  networking.firewall = {
    allowedTCPPorts = [25565];
    allowedUDPPorts = [
      25565

      # voice chat
      24454
    ];
  };
}
