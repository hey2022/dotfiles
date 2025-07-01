{
  config,
  lib,
  ...
}:
{
  options = {
    profiles.vm.enable = lib.mkEnableOption "VM support";
  };
  config = lib.mkIf config.profiles.vm.enable {
    programs.virt-manager.enable = true;
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
        };
      };
      spiceUSBRedirection.enable = true;
    };
  };
}
