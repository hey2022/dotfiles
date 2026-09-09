{ config, lib, ... }:
{
  options.users.baseGroups = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [
      "${config.programs.ydotool.group}"
      "${config.services.caddy.group}"
      "adbusers"
      "gamemode"
      "libvirtd"
      "networkmanager"
      "uinput"
      "wheel"
      "wireshark"
    ];
    description = "List of base groups";
  };
}
