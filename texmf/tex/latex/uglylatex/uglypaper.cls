%
% This is file `uglypaper.cls',
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
\ProvidesClass{uglypaper}[
  2025/03/14 Customized document class based on `aritcle'
]
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Process Control Packages.
% 
% Note these packages must be imported before the Complier constraint.
\RequirePackage{ifxetex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complier constraint, forcing user to use XeLaTeX and give necessary error 
% message.
\RequireXeTeX
\ifxetex\else
\ClassError{uglypaper}{
You must use the `xelatex' driver\MessageBreak }{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options processing.
% Note this part of TeX must be `input' not `imported', which means, must use
% `\input' not `\usepackage' or `\RequirePackage'.
\input{classoptions}

% Pass document class options to the `article' class, and load the class.
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax

% Load the class.
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import customized packages
\RequirePackage{dependencies}
\RequirePackage{docfmt}
\RequirePackage{docpapersize}
\RequirePackage{doccolor}
\RequirePackage{doccaptions}
\RequirePackage{doclanguage}
% \RequirePackage{docappendix}
\RequirePackage{commands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title format settings.

\RequirePackage{customized_headers/paperheaders}

% 摘要格式设置
\RequirePackage{customized_abstract/runin_abstract}

% 调整摘要位置的间距
% \setlength{\absleftindent}{1.18cm} % 控制摘要左缩进
% \setlength{\absrightindent}{1.18cm} % 控制摘要右缩进

% 设置目录标题样式
%
% 拓宽 section 标题序号后面的间距
\addtolength{\cftsecnumwidth}{1em}
%
% 目录标题：三号宋体，加粗，居中，段前20磅，段后10磅，无缩进，
% “目”和“录”之间空4格；
% \renewcommand{\contentsname}{\centering 目\ \ \ \ 录}
\renewcommand{\cfttoctitlefont}{\hfill\normalsize} % ToC = Table of Contents
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\normalsize} % LoF = List of Figures
\renewcommand{\cftafterloftitle}{}
\renewcommand{\cftlottitlefont}{\normalsize} % LoT = List of Tables
\renewcommand{\cftafterlottitle}{}

% 设置页眉和页脚
\pagestyle{fancy}
% \fancyhead{} % 仅清空页眉
% \renewcommand{\headrulewidth}{0pt} % 去掉页眉的横线

% 附录格式设置
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

% 定义新的命令

% 精确调整 aritcle title 的位置
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
