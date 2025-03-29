{...}: {
  services.kanata = {
    enable = true;
    keyboards.all = {
      config = ''
        (defsrc)

        (deflayermap (base-layer)
          caps (tap-hold-press 200 200 caps lctl))
      '';
      extraDefCfg = ''
        process-unmapped-keys yes
      '';
    };
  };
}
