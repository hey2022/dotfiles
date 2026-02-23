{
  boot = {
    initrd = {
      systemd.enable = true; # for zswap lz4
      kernelModules = [ "lz4" ];
    };
    kernelParams = [
      "zswap.enabled=1"
      "zswap.compressor=lz4"
      "zswap.max_pool_percent=20"
      "zswap.shrinker_enabled=1"
    ];
    kernel.sysctl = {
      "vm.swappiness" = 10;
    };
  };
}
