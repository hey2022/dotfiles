{
  # Config location: ~/.local/state/syncthing/config.xml
  # Used for changing sync folder location
  # Stop syncthing, edit the location, then restart
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;
  };
}
