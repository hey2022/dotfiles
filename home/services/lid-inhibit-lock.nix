{
  ...
}:

{
  systemd.user.services."lid-inhibit-lock" = {
    Unit = {
      Description = "Inhibit lid lock.";
    };
    Service = {
      Type = "simple";
      ExecStart = ''systemd-inhibit --what=handle-lid-switch --why="Inhibit lid lock" sleep infinity'';
    };
  };
}
