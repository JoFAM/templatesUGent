% Class file for ugentnotes
% Joris Meys
% 2019-06-23
% --- Class structure identification
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugentnotes}[2019/06/23 v0.0.1 ugentnotes]

% --- Class structure declaration of options
%
%  This class extends article class

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% --- Class structure execution of options
%
\ProcessOptions \relax

\LoadClass{article}

% --- Class structure: Loading of extra packages
%
\RequirePackage[a4paper,portrait]{geometry}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage[pdfborder={0 0 0}]{hyperref}

% Use Helvetica to stay as close as possible to Arial
%\RequirePackage{helvet} 
%\renewcommand{\familydefault}{\sfdefault}
%\RequirePackage{sansmath} % gives helvetica math
\RequirePackage{times} %load times new roman type 1 fonts


% --- Class structure: layout issues
%
\geometry{lmargin=72.0bp,rmargin=72.0bp,tmargin=72.0bp,bmargin=72.0bp}
\parindent 0pt
\parskip 6pt

\newcommand{\Page}{page}
\newcommand{\emptyline}{\hfill}

% --- Class structure: Definitions

% make the title empty
\global\let\@title\empty

\def\@module{}
\global\let\@module\emptyline
\def\module#1{\def\@module{#1}}

\def\@course{}
\def\course#1{\def\@course{#1}}

\def\@author{}
\def\author#1{\def\@author{#1}}

\def\@date{}
\def\date#1{\def\@date{#1}}

\def\@pname{}
\global\let\@pname\Page
\def\pname#1{\def\@pname{#1}}



\newcommand\chapter[1]{
	\vspace{36pt}
 	
	{\LARGE \textbf{#1} }
	
	
	\vspace{24pt}
	\hrule
	\vspace{12pt}
	}



% --- CONSTRUCT HEADER OF TITLE PAGE

\renewcommand{\maketitle}{
		\begin{picture}(0,0)(23,45)
				\includegraphics{logo_UGent_NL_RGB_2400_kleur-op-wit.png}
		\end{picture}
	\noindent	
  \vspace*{-1.4cm}
	\begin{flushright}
\textbf{
	\@course \\
	\@author \\
	\@module
	}
	\end{flushright}
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% depth of numbering and depth of table of contents %

% Working on the floats
\renewcommand{\topfraction}{0.7}	% max fraction of floats at top
\renewcommand{\bottomfraction}{0.8}	% max fraction of floats at bottom
%   Parameters for TEXT pages (not float pages):
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}     % 2 may work better

% --- Construction of the first and following pages
%

\AtBeginDocument{

% Check that necessary documentation is filled in
\ifx\@course\empty
    \PackageError{bwexam}{You need to fill in the course}
\fi

\ifx\@author\empty
    \PackageError{bwexam}{You need to fill in the author}
\fi

\ifx\@title\empty

\else
    \PackageError{bwpracticum}{This class uses chapter instead of title.}
\fi

\maketitle


}

