{
  services.wayscriber = {
    enable = true;
    settings = {
      keybindings = {
        select_pen_tool = [ "P" ];
        select_eraser_tool = [ "E" ];
        select_line_tool = [ "L" ];
        clear_canvas = [ "Ctrl+Delete" ];
        set_color_pink = [ ];
      };
      ui = {
        toolbar = {
          top_pinned = false;
          side_pinned = false;
        };
      };
      drawing = {
        default_eraser_mode = "stroke";
      };
      tablet = {
        enabled = true;
      };
      capture = {
        save_directory = "~/pictures/wayscriber";
      };
    };
  };
}
