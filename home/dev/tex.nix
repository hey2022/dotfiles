{pkgs, ...}: {
  home.packages = with pkgs; [texlive.combined.scheme-full texlab];
  home.file.".latexmkrc".text = ''
    $pdf_mode = 1;
    $pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape';
  '';
}
