let
  beetsSettings = import ../../../common/beets.nix { };
in
{
  programs.beets = {
    enable = true;
    settings = beetsSettings;
  };
}
