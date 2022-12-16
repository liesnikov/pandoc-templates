# bits and pieces stolen from https://github.com/serokell/nix-pandoc/

{ stdenv, lib, pandoc, texlive, biber,
  makeFontsConf, source-serif, source-sans, source-code-pro}:
let texlive-combined = texlive.combine { inherit (texlive)
      scheme-basic xetex latexmk
      fontspec # Advanced font selection in XeLaTeX and LuaLaTeX
      koma-script  # Replacement classes for the article, report, and book classes with emphasis on typography and versatility.
      unicode-math # render math symbols in unicode?
      xcolor # for coloured text
      todonotes # for todo-pop-ups
      biblatex # biblatex support
      hyperref # for references and links
      fancyvrb # fancy verbatim text
      ; };
    extraTexInputs = [ ];
    extraBuildInputs = [ ];
in stdenv.mkDerivation ({

  name = "document";
  src = builtins.filterSource
    (path: type: !(builtins.elem (builtins.baseNameOf path) ["main.pdf" "result"]))
    ./.;

  nativeBuildInputs =
    [ pandoc texlive-combined biber ] ++  extraBuildInputs;

  buildPhase = ''
    make main.pdf
  '';

  installPhase = ''
    mkdir $out
    mv main.pdf $out/main.pdf
  '';

  FONTCONFIG_FILE = makeFontsConf { fontDirectories = [source-serif source-sans source-code-pro]; };

  TEXINPUTS =
    builtins.concatStringsSep ":" ([ "." ] ++ extraTexInputs ++ [ "" ]);
})
