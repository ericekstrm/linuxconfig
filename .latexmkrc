$pdflatex = 'xelatex --enable-write18 --synctex=1 --shell-escape %O %S';
$pdf_previewer = "xdg-open %O %S";
$preview_continuous_mode = 1;
$pdf_mode = 1;
$dvi_mode = 0;
$postscript_mode = 0;

$out_dir='build';
$success_cmd = 'cp %D $(basename $(echo %T | tr / _) .tex).pdf';
