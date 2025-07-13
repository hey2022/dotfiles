{
  home.sessionVariables = {
    fish_greeting = "";
  };
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';
    shellAliases = {
      ls = "eza -g";
      cat = "bat -p";
    };
  };
}
