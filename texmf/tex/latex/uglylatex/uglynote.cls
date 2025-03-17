%
% This is file `uglynote.cls',
% created for UglyLaTeX.
%
% Copyright (C) 2025 Githubonline1396529
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License (LPPL),
% either version 1.3c of this license or (at your option)
% any later version. The latest version of this license is in:
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of
% LaTeX version 2005/12/01 or later.
%
% This work has the LPPL maintenance status "maintained".
%
\ProvidesClass{uglynote}[
  2025/03/14 Customized document class based on `aritcle'
]
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Process Control Packages.
% 
% Note these packages must be imported before the Complier constraint.
\RequirePackage{ifxetex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complier constraint, forcing user to use XeLaTeX and give necessary
% error message.
\RequireXeTeX
\ifxetex\else
\ClassError{uglynote}{
  You must use the `xelatex' driver\MessageBreak }{%
    Just choose `xelatex', no `pdflatex' or `latex' and so on.
  }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options processing.
%
% Note that this part of TeX must be `input' rather than `imported',
% meaning that `\input' must be used instead of `\usepackage' or
% `\RequirePackage'.
\input{classoptions}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pass document class options to the `article' class, and load the class.
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{article}
 }
\ProcessKeyvalOptions*\relax

% Load the class.
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import customized packages.

\RequirePackage{dependencies}
\RequirePackage{docfmt}
\RequirePackage{docpapersize}
\RequirePackage{doccolor}
\RequirePackage{doccaptions}
\RequirePackage{doclanguage}
\RequirePackage{commands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title format settings.

\RequirePackage{customized_headers/noteheaders}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract format setting.

\RequirePackage{customized_abstract/abstractblock}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of content format setting.
\RequirePackage{customized_toc/toclines}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set the page header and the page footer.
\pagestyle{fancy} % Use the footheader style `fancy'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Appendix format settings.
\renewcommand{\appendix}{%
  \par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  \renewcommand{\thesection}{\Alph{section}}%
  \titleformat{\section}
  {\centering\bfseries\large\color{ecolor}}
  {\Alph{section}. }{0em}{}
  \renewcommand{\thesubsection}{\thesection.\arabic{subsection}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additional defined functional commands. Defined in `commands.sty'.
\RequirePackage{commands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine `\maketitle' command to:
%   1. Accurately adjust the position of `title'.
%   2. Colour the title text lines with `ecolor'.
%
% See also: The titling package <texdoc titling>
% Note: I forget what I should note here, but I really sure I've got
% something to note with, so I kept the `Note:' mark here to remind myself
% writting the note down immediately once I recall it.
\makeatletter
\def\@maketitle{%
  \color{ecolor}
  \newpage
  \null
  \vskip 2em%
  \vspace*{\droptitle}
  \maketitlehooka
  {\@bspretitle \@title \@bsposttitle}
  \maketitlehookb
  {\@bspreauthor \@author \@bspostauthor}
  \maketitlehookc
  {\@bspredate \@date \@bspostdate}
  \maketitlehookd
  \par
\vskip 1.5em}

\renewcommand{\maketitle}{\par
  \begingroup
  \@bsmarkseries
  \def\@makefnmark{\rlap{\@textsuperscript{%
  \normalfont\@bsthanksheadpre \tamark \@bsthanksheadpost}}}%
  \long\def\@makefntext##1{\makethanksmark ##1}
  \if@twocolumn
  \ifnum \col@number=\@ne
  \@maketitle
  \else
  \twocolumn[\@maketitle]%
  \fi
  \else
  \newpage
  \global\@topnum\z@
  \@maketitle
  \fi
  \thispagestyle{plain}\@thanks
  \endgroup
  \@bscontmark % \setcounter{footnote}{0}%
  %%%     \@bsmtitlempty
} % end non-titlepage

\makeatother
