%
% This is file `uglyrep.cls',
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
\ProvidesClass{uglyrep}[
  2025/03/14 Customized document class based on `report'
]
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Process Control Packages.
% 
% Note these packages must be imported before the compiler constraint.
\RequirePackage{ifxetex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compiler constraint, forcing the user to use XeLaTeX and providing 
% necessary error messages.
%
% \RequireXeTeX
% \ifxetex\else
% \ClassError{uglyrep}{
% You must use the `xelatex' driver\MessageBreak }{
% Just choose `xelatex', no `pdflatex' or `latex' and so on.}
% \fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options processing.
%
% Note that this part of TeX must be `input' rather than `imported',
% meaning that `\input' must be used instead of `\usepackage' or
% `\RequirePackage'.
\input{classoptions}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pass document class options to the `article' class and load the class.
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessKeyvalOptions*\relax

% Load the class.
\LoadClass{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import customized packages
\RequirePackage{dependencies}
\RequirePackage{docfmt}
\RequirePackage{docpapersize}
\RequirePackage{doccolor}
\RequirePackage{doccaptions}
\RequirePackage{doclanguage}
% \RequirePackage{docappendix}
\RequirePackage{commands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title format settings.

\RequirePackage{customized_headers/reportheaders}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract format settings
\RequirePackage{customized_abstract/abstractpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set table of contents title style.
\RequirePackage{customized_toc/tocpage}

% LaTeX will treat the table of contents title as a top-level Chapter or
% Section by default, adding it to the header. If the main text following
% the table of contents is not immediately a top-level Chapter or Section
% but, for example, some ordinary text, then this text will be forcefully
% assigned the "Contents" header. However, these text are not actual table
% of content.
%
% To solve this issue, I experimented for over six months, trying many 
% methods but failing to resolve it. After a long time, this single line
% of code became the final solution.
%
% Simply put, the principle is to use LaTeX's process control package 
% `etoolbox` to clear the header once every time (actually just once) when
% `\tableofcontents` is executed. I haven't thought of a better method 
% yet, and I'm unsure if this approach has any unforeseen issues, so I'll
% use it for now.
\apptocmd\tableofcontents{\clearpage\markboth{}{}}

% Ensure a page break after the table of contents.
% 
% \apptocmd{\tableofcontents}{\clearpage}{}{}

% Set headers and footers
% Header settings
\pagestyle{fancy}
% \fancyhead{}
% \fancyhead[LE,RO]{\thepage} % Page numbers
% \fancyhead[LO]{\nouppercase{\rightmark}} % Left page chapter title
% \fancyhead[RE]{\nouppercase{\leftmark}} % Right page chapter title
\renewcommand{\chaptermark}[1]{
  \markboth{\thechapter#1}{}
}

% Appendix format settings
\renewcommand{\appendix}{%
  \par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \titleformat{\chapter}[hang]
  {\centering\bfseries\large\color{ecolor}}
  {\Alph{chapter}. }
  {0em}
  {}
  \renewcommand{\thesection}{\thechapter.\arabic{section}}%
}

% Caption format settings.

% The caption number in a report (I mean, in this document class, 
% `uglyrep', which usually used in reports), should be numbered after the
% chapter number, instead of just a number sequence.
\numberwithin{table}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{equation}{chapter}
% Set listings code block to be numbered after chapter numbers.
% \AtBeginDocument{
%   \counterwithin{lstlisting}{section}
% }
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
% \renewcommand{\thelstlisting}{\arabic{section}.\arabic{lstlisting}}
