% -----------------------------------------------------------------------------
% Contributors:
% -----------------------------------------------------------------------------
% Vasile Drumea - 2022-2023 - Created the first known latex template for UTM reports
% Alex Andries - 2025 - Added code to format the Bibliography according to UTM standards and Appendix styling
% Artiom Balan, Denis Prodan - 2025 - Rewrote it from scratch, simplifying it
% -----------------------------------------------------------------------------


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utm_report}[2025/05/21 Simple Report Class]

% 12pt text size
\LoadClass[12pt]{report}

% Margins 2cm except for 1cm on the right
\RequirePackage[a4paper,top=2cm,right=1cm,bottom=2cm,left=2cm]{geometry}
\RequirePackage[english]{babel}


\PassOptionsToPackage{hyphens}{url}   % Allow breaking long url-s at hyphens
\RequirePackage{amsmath,graphicx,float,hyperref}
\RequirePackage{mathptmx} % Times New Roman font (closest you can get to it)
\RequirePackage{titlesec} % provides \titleformat, \titlespacing
\RequirePackage{indentfirst}  % Indent first paragraph
\RequirePackage{etoolbox}  % provides \AtBeginEnvironment
\RequirePackage{fvextra}  % Gotta load this before csquotes
\RequirePackage{csquotes}


% ===================
% Text and chapter titles
% ===================

% 1.5 line spacing
\RequirePackage{setspace}
\setstretch{1.5}

% 1.25 cm paragraph indentation
\setlength{\parindent}{1.25cm}

% Remove any extra space between list items
\RequirePackage{enumitem}
\setlist{itemsep=0pt, topsep=0pt, parsep=0pt, partopsep=0pt}

% Sets the separator between lists and left margin aligned with paragraphs
\setlist{nolistsep}
\setlist[itemize]{label={--}, leftmargin=\parindent}


% Chapter titles: centered, 14pt, bold, normal case
\titleformat{\chapter}[block]
  {\centering\bfseries\fontsize{14pt}{16pt}\selectfont}
  {\thechapter}
  {1em}
  {}
% Remove some default space above chapter, and add an empty line below
\titlespacing*{\chapter}{0pt}{-1\baselineskip}{1\baselineskip}

% Section titles: left-aligned, 12pt, bold
\titleformat{\section}[hang]
  {\bfseries\fontsize{12pt}{14pt}\selectfont}
  {\thesection}
  {1em}
  {}
\titlespacing*{\section}{0pt}{\baselineskip}{0pt}

% Same for subsections
\titleformat{\subsection}[hang]
  {\bfseries\fontsize{12pt}{14pt}\selectfont}
  {\thesubsection}
  {1em}
  {}
\titlespacing*{\subsection}{0pt}{\baselineskip}{0pt}


\preto\figure{\vspace{5pt}}  % add a bit of space before every figure



% ===================
% Table Of Contents (TOC, LOF, LOT, Glossary)
% ===================


% Deepest level : X.X
\setcounter{tocdepth}{1}

% Set TOC entries (chapters and sections) to 12pt font

% Rename titles in English
\addto\captionsenglish{%
  \renewcommand{\contentsname}{TABLE OF CONTENTS}%
  \renewcommand{\listfigurename}{LIST OF FIGURES}%
  \renewcommand{\listtablename}{LIST OF TABLES}%
  \renewcommand{\glossaryname}{GLOSSARY}%
}


\RequirePackage{tocloft}        % Customize TOC/LOF/LOT

% Set fonts for TOC entries
\renewcommand{\cftchapfont}{\bfseries}
\renewcommand{\cftsecfont}{}

% Titles font, centered, 14pt
\renewcommand{\cfttoctitlefont}{\hfill \fontsize{14}{17}\selectfont \bfseries}
\renewcommand{\cftloftitlefont}{\hfill \fontsize{14}{17}\selectfont \bfseries}
\renewcommand{\cftlottitlefont}{\hfill \fontsize{14}{17}\selectfont \bfseries}
\renewcommand{\cftaftertoctitle}{\hfill\hfill}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftafterlottitle}{\hfill}

% Remove extra vertical space between chapters and sections in TOC
\setlength{\cftbeforechapskip}{0pt}   % space before chapter entry
\setlength{\cftbeforesecskip}{0pt}   % space before section entry
\setlength{\cftparskip}{0pt}

% Titles skips
\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{10pt}
\setlength{\cftbeforeloftitleskip}{0pt}
\setlength{\cftafterloftitleskip}{10pt}
\setlength{\cftbeforelottitleskip}{0pt}
\setlength{\cftafterlottitleskip}{10pt}

% Indentation of entries in TOC
\setlength{\cftchapindent}{0pt}
\setlength{\cftsecindent}{1.5em}    % indent sections by 1.5em

% Control dot leaders
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}



\setlength{\cftbeforefigskip}{0pt}       % space before figures in LOF
\setlength{\cftbeforetabskip}{0pt}       % space before tables in LOT
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}


% ===================
% Code Listings
% ===================

\RequirePackage{minted}

% Global settings for all minted code blocks,
% Set font to Courier New and size to small globally
\setminted{
    style=borland,
    frame=lines,           % Add frame around code blocks
    linenos=true,           % Add line numbers
    numbersep=10pt,         % Distance between line numbers and code
    framesep=8pt,           % Space between code and the frame
    framerule=0.2mm,         % Frame thickness
    breaklines=true,
    baselinestretch=1,      % line spacing should be 1 instead of 1.5 like the rest of the text
    fontfamily=pcr,    % Courier New font
}
\setminted{fontsize=\fontsize{10pt}{12pt}\selectfont}


% Add chapter numbering to the caption and TOC of listings
\makeatletter
\renewcommand*{\thelisting}{\thechapter.\arabic{listing}}
\@addtoreset{listing}{chapter}
\makeatother




% ===================
% Tables
% ===================

\RequirePackage{array}        % For column definition
\RequirePackage{tabularx}     % For automatic column width
\RequirePackage{makecell}     % For line breaks inside cells
\RequirePackage{booktabs}     % For professional-looking horizontal lines
\RequirePackage{ragged2e}

\AtBeginEnvironment{tabular}{\fontsize{11pt}{13pt}\selectfont}
\AtBeginEnvironment{tabularx}{\fontsize{11pt}{13pt}\selectfont}
\AtBeginEnvironment{longtable}{\fontsize{11pt}{13pt}\selectfont}

% set border width
\setlength{\arrayrulewidth}{0.5pt}
% Increase row height in tables
\renewcommand*{\arraystretch}{1.2}

% Justified paragraph column type for body cells
\newcolumntype{Y}{>{\noindent\justifying\arraybackslash}X}



% ===================
% Captions
% ===================

\RequirePackage{caption}

\DeclareCaptionLabelSeparator{dash}{ - }

\captionsetup[figure]{
    labelfont=bf,
	labelsep=dash,
	font={bf},
	format=plain,
    aboveskip=10pt
}

\captionsetup[subfigure]{
    labelformat=simple,
    labelsep=none
}

\captionsetup[listing]{
    labelfont=bf,
    labelformat=simple,
    labelsep=dash,
    font={bf},
    % aboveskip doesn't work in here for some reason, so we set it globally to 0pt,
    % and adjust the spacing in other captions (where aboveskip it works)
}

\DeclareCaptionLabelFormat{tablel}{Table #2}
\captionsetup[table]{
    labelfont=bf,
    labelformat=tablel,
    font={bf},
    position=top,
	labelsep=dash, 
	justification=raggedleft, 
	singlelinecheck=off,
    aboveskip=10pt
}

\setlength{\abovecaptionskip}{0pt} 
\setlength{\belowcaptionskip}{0pt}



% ================================
% Bibliography in UTM Style

% The advisers say you can use the built-in IEEE style as well,
% But we still do it by the UTM standard:
% SM ISO 690:2012 Informare și documentare. "Reguli pentru prezentarea referințelor bibliografice și citarea resurselor de informare", aprobat de către Institutul de Standardizare din Moldova
% ================================

% You can sort the entries alphabetically or by their aparition in text,
% both are allowed (tho i prefer by their aparition, sorting=none)
\RequirePackage[sorting=none]{biblatex}

% helper: if the number is <10 prepend a 0
\newcommand*{\padzero}[1]{%
  \ifnum#1<10 0#1\else #1\fi%
}

\setlength{\biblabelsep}{5pt}

\DeclareFieldFormat{labelnumberwidth}{#1\adddot}

% 1) ensure "LAST, First" order
\DeclareNameAlias{author}{family-given}
% 2) print family name in uppercase (no bold)
\renewcommand*{\mkbibnamefamily}[1]{\MakeUppercase{#1}}
% 3) print given name as-is
\renewcommand*{\mkbibnamegiven}[1]{#1}
% 4) if you use prefixes/suffixes, keep them unchanged:
\renewcommand*{\mkbibnameprefix}[1]{#1}
\renewcommand*{\mkbibnamesuffix}[1]{#1}

% 1) tell biblatex how to format titles of @online entries:
\DeclareFieldFormat[online]{title}{%
  \mkbibemph{#1}%        "Title" in italics as usual
  \addspace
  \textnormal{[online]}% add "[online]" upright
}

%% 1) You already have this:
\DeclareFieldFormat{urldate}{%
  \mkbibbrackets{%
    Cited~on\space
    % zero-padded day.month.year
    \padzero{\thefield{urlday}}.\padzero{\thefield{urlmonth}}.\printfield{urlyear}%
  }%
}
%% 2) Smart date: print [Cited on…] only if there's no pages field
\renewbibmacro*{date}{%
  \printdate%                              % year[.month[.day]]
  \iffieldundef{pages}%                    % if no pages at all
    {\iffieldundef{urlday}{}%              %   and if urldate present
      {\addspace\printurldate}}%           %     print it here
    {}%                                    % else (pages exist) do nothing
}
%% 3) Patch the chapter+pages macro so that immediately after "pp.…" 
%%    your [Cited on …] is printed.
\renewbibmacro*{chapter+pages}{%
  \printfield{chapter}%               % for a chapter number, if any
  \setunit{\bibpagespunct}%            % e.g. ", pp. "
  \printfield{pages}%                 % the page range
  \iffieldundef{urlday}
    {}%
    {\addspace\printurldate}%         % ← your [Cited on DD.MM.YYYY]
  \newunit
}
%% 4) Prevent a second citation‐date at the very end
\renewbibmacro*{url+urldate}{%
  \printfield{url}%                   % only the URL here
}



% ===================
% Appendix 
% ===================

% Define a custom chapter format for appendices
\newcommand{\appendixchapter}[1]{
  \cleardoublepage
  \refstepcounter{chapter}
  \begin{center}
    \normalfont\bfseries\large APPENDIX \Alph{chapter}\\
    \normalfont\bfseries\normalsize #1
  \end{center}
  \addcontentsline{toc}{chapter}{APPENDIX \Alph{chapter}}
}