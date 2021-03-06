% Class file for ugentnotes
% Joris Meys
% 2019-06-23
% --- Class structure identification
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugentnotes}[2020/09/28 v0.0.4 ugentnotes]

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
\RequirePackage{amsmath}
\RequirePackage[pdfborder={0 0 0}]{hyperref}
\RequirePackage[x11names]{xcolor}
%\RequirePackage{enumitem}

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

\newcommand{\fullwidth}[1]{
  \medskip
  \par\rlap{\parbox{\textwidth}{#1}}
}

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

% --- Create the exercises environment
% Make the exercise name changeable. This should be dependent upon 
% language settings, but no bloody clue how to do that...
\newcommand\Oefeningen{Oefeningen}
\def\@exercisename{}
\global\let\@exercisename\Oefeningen
\def\exercisename#1{\def\@exercisename{#1}}

% --- Definition exercise environment

\newcounter{exctr}
\newcounter{qcounter}
 

\newenvironment{exercise}{%      define a custom environment
   \bigskip\noindent%         create a vertical offset to previous material
   \refstepcounter{exctr}% increment the environment's counter
   \par\nobreak\@afterheading 
   \noindent\textcolor{lightgray}{\rule{\textwidth}{1mm}} % Add a line
   \textbf{\textsc{\@exercisename~\theexctr }}
   \par\nobreak\@afterheading 
   \medskip
	 \par\nobreak\@afterheading 
  % Define a custom list environment in here. This works fine, and 
  % enumerates using letters
  \begin{list}{\bfseries\theexctr.\arabic{qcounter}.}{
        \usecounter{qcounter}
        \setlength{\labelwidth}{30em}
        \setlength{\leftmargin}{33pt}
        \setlength{\labelsep}{6pt}
        \setlength{\itemsep}{0pt}
        \setlength{\listparindent}{0em}
        \setlength{\topsep}{6pt}
        \setlength{\itemindent}{0pt}
    } 
   }{\par\nopagebreak\fullwidth{\textcolor{lightgray}{\rule{\textwidth}{1mm}}}\end{list}\par\nopagebreak
   \bigskip\ignorespacesafterend }  %          create a vertical offset to following material
\numberwithin{exctr}{section}

% - make highlighting possible

\newcommand{\hlitem}{\stepcounter{qcounter}\item[ \textbf{* \bfseries\theexctr.\arabic{qcounter}.}]}


% - Create the title using chapter.
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

