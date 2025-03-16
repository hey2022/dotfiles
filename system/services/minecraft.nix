{...}: {
  networking.firewall = {
    allowedTCPPorts = [25565];
    allowedUDPPorts = [25565];
  };
}
