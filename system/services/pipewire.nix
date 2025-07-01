{ ... }:
{
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };
}
