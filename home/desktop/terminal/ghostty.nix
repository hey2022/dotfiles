{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      gtk-single-instance = true;
      gtk-tabs-location = "bottom";
      gtk-wide-tabs = false;
      background-opacity = 0.9;
      font-family = [
        "Iosevka Custom"
        "Symbols Nerd Font"
      ];
      font-size = 12;
      keybind = [
        "alt+tab=toggle_tab_overview"
        "alt+q=close_surface"
        "alt+h=previous_tab"
        "alt+l=next_tab"
        "alt+shift+h=move_tab:-1"
        "alt+shift+l=move_tab:1"
        "alt+n=new_tab"
        "alt+w>v=new_split:right"
        "alt+w>s=new_split:down"
        "alt+w>q=close_surface"
        "alt+w>h=goto_split:left"
        "alt+w>j=goto_split:bottom"
        "alt+w>k=goto_split:top"
        "alt+w>l=goto_split:right"
      ];
    };
  };
}
