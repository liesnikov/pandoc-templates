# Based on github.com/serokell/nix-pandoc
# SPDX-FileCopyrightText: 2020 Serokell <https://serokell.io>
#
# SPDX-License-Identifier: MPL-2.0

{ stdenv, lib, pandoc, texlive,
  makeFontsConf, source-serif, source-sans, source-code-pro}:
let texlive-combined = texlive.combine { inherit (texlive)
      scheme-basic xetex latexmk
      fontspec koma-script  # ??
      unicode-math # ??
      xcolor # for coloured text
      todonotes # for todo-pop-ups
      hyperref # for references and links
      beamer # for slides
      listings # for code snippets
      ulem # for strikethrough
      extsizes # to enable custom font sizes
      fancyvrb # fancy verbatim text
      ; };
    extraTexInputs = [ ];
    extraBuildInputs = [ ];
in stdenv.mkDerivation ({

  name = "slides-for-the-fp-course";
  src = builtins.filterSource
    (path: type: !(builtins.elem (builtins.baseNameOf path) ["main.pdf" "result" "fonts.patch"]))
    ./.;

  nativeBuildInputs =
    [ pandoc texlive-combined] ++  extraBuildInputs;

  buildPhase = ''
    make main.pdf
  '';

  installPhase = ''
    mkdir $out
    mv main.pdf $out/main.pdf
  '';

  FONTCONFIG_FILE = makeFontsConf { fontDirectories = [source-sans source-code-pro source-serif]; };

  TEXINPUTS =
    builtins.concatStringsSep ":" ([ "." ] ++ extraTexInputs ++ [ "" ]);
})
