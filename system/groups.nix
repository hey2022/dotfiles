{lib, ...}: {
  options.users.baseGroups = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [
      "gamemode"
      "networkmanager"
      "uinput"
      "wheel"
      "wireshark"
    ];
    description = "List of base groups";
  };
}
