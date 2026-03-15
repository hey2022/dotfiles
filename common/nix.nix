{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trace-import-from-derivation = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      dates = "05:00";
    };
  };
}
