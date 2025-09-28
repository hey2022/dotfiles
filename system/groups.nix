{ config, lib, ... }:
{
  options.users.baseGroups = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [
      "adbusers"
      "gamemode"
      "libvirtd"
      "networkmanager"
      "uinput"
      "wheel"
      "wireshark"
      "${config.programs.ydotool.group}"
    ];
    description = "List of base groups";
  };
}
