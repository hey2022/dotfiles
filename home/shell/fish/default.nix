_: {
  home.sessionVariables = {
    fish_greeting = "";
  };
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';
  };
}
