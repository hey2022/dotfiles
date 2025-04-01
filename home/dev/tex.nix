{pkgs, ...}: {
  home.packages = with pkgs; [texlive.combined.scheme-full texlab];
  home.file.".latexmkrc".text = ''
    $pdf_mode = 4;
    $lualatex = 'lualatex -interaction=nonstopmode -shell-escape';
  '';
}
