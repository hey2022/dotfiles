{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tex-fmt
    texliveMedium
  ];
  home.file.".latexmkrc".text = ''
    $pdf_mode = 4;
    set_tex_cmds("-interaction=nonstopmode -shell-escape -synctex=1 %O %S");
  '';
}
