\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template}[2026/08/19 Reusable report template]

% ---------------------------------------------------------------------------
% Klassenoptionen
% ---------------------------------------------------------------------------
% Die Textgröße kann direkt im Dokument gesetzt werden:
%   \documentclass[10pt]{template}
%   \documentclass[11pt]{template}  % Vorgabe / Standard
%   \documentclass[12pt]{template}
%
% Ohne Angabe werden 11 pt verwendet.
\newif\iftemplate@withmacros
\template@withmacrostrue

\newcommand{\TemplateBaseFontSize}{11pt}

\DeclareOption{10pt}{\renewcommand{\TemplateBaseFontSize}{10pt}}
\DeclareOption{11pt}{\renewcommand{\TemplateBaseFontSize}{11pt}}
\DeclareOption{12pt}{\renewcommand{\TemplateBaseFontSize}{12pt}}

\DeclareOption{withmacros}{\template@withmacrostrue}
\DeclareOption{nomacros}{\template@withmacrosfalse}

% Weitere Optionen werden an report weitergereicht.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[\TemplateBaseFontSize]{report}

% ---------------------------------------------------------------------------
% ZENTRALE FORMATVORGABEN
% ---------------------------------------------------------------------------
% Diese Werte können an einer Stelle angepasst werden.

% Überschriften
% Alle Gliederungsebenen verwenden exakt die normale Fließtextgröße.
% Bei \documentclass[11pt]{template} sind sie damit alle 11 pt.
% Absatzformatierung
% Die Vorgabe verlangt einzeiligen Zeilenabstand.
% Neue Absätze werden nicht eingerückt und erhalten nur einen kleinen Abstand.
\newcommand{\TemplateParagraphSpacing}{3pt}
\newcommand{\setparagraphspacing}[1]{%
  \renewcommand{\TemplateParagraphSpacing}{#1}%
  \setlength{\parskip}{\TemplateParagraphSpacing}%
}

% Abstand zwischen Caption und Abbildung/Tabelle.
% Kann im Dokument mit \setcaptiongap{...} geändert werden.
\newcommand{\TemplateCaptionContentGap}{3pt}
\newcommand{\setcaptiongap}[1]{%
  \renewcommand{\TemplateCaptionContentGap}{#1}%
  \captionsetup[figure]{skip=\TemplateCaptionContentGap}%
  \captionsetup[table]{skip=\TemplateCaptionContentGap}%
}

% Seitenränder laut Vorgabe
\newcommand{\TemplateMarginTop}{3.3cm}
\newcommand{\TemplateMarginBottom}{2.5cm}
\newcommand{\TemplateMarginLeft}{2.5cm}
\newcommand{\TemplateMarginRight}{2.5cm}

% Verzeichnis-/Dokumentbezeichnungen
\newcommand{\TemplateBibliographyTitle}{Literaturverzeichnis}
\newcommand{\TemplateAppendixListTitle}{Anhangsverzeichnis}

% Das Inhaltsverzeichnis beginnt laut Vorgabe auf Seite II.
\newcommand{\TemplateFrontMatterStartPage}{2}


% ---------------------------------------------------------------------------
% Schrift, Sprache und Kodierung
% ---------------------------------------------------------------------------
% Für echtes Arial wird XeLaTeX oder LuaLaTeX verwendet.
\RequirePackage{iftex}

\ifPDFTeX
  \ClassError{template}
    {Dieses Template benoetigt XeLaTeX oder LuaLaTeX}
    {Die Vorgabe verlangt Arial. Bitte in Overleaf den Compiler auf XeLaTeX stellen.}
\else
  \RequirePackage{fontspec}
  \setmainfont{Arial}
  \setsansfont{Arial}
\fi

\RequirePackage[ngerman]{babel}

% ---------------------------------------------------------------------------
% Allgemeine Pakete
% ---------------------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{nccmath}

\RequirePackage{xcolor}
\RequirePackage{multicol}
\RequirePackage{listings}

\RequirePackage{tikz}
\RequirePackage{adigraph}
\RequirePackage{float}
\RequirePackage{subcaption}

\RequirePackage[many]{tcolorbox}
\tcbuselibrary{listings,breakable}
\RequirePackage{etoolbox}

\RequirePackage{tocloft}
\RequirePackage{titlesec}
\RequirePackage{needspace}

\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

\RequirePackage{tabularx}
\RequirePackage{ltablex}
\RequirePackage{enumitem}

\RequirePackage{fancyhdr}
\RequirePackage{soul}
\RequirePackage{setspace}
\RequirePackage{chngcntr}

\RequirePackage{pdfpages}
\RequirePackage{pdflscape}

% ---------------------------------------------------------------------------
% Abkürzungen und Quellen
% ---------------------------------------------------------------------------
\RequirePackage{acro}
\RequirePackage{csquotes}

% Harvard-Zitationsstil (University of Bath / biblatex-bath):
%   \parencite{key}      -> (Autor, Jahr)
%   \parencite[12]{key}  -> (Autor, Jahr, S. 12)
%   \textcite{key}       -> Autor (Jahr)
\RequirePackage[
  backend=biber,
  style=bath
]{biblatex}

% Standarddateien werden automatisch eingebunden, wenn sie vorhanden sind.
\IfFileExists{references.bib}{%
  \addbibresource{references.bib}%
}{}

\IfFileExists{acronyms.tex}{%
  \input{acronyms.tex}%
}{}

% ---------------------------------------------------------------------------
% Eigenes Anhangsverzeichnis
% ---------------------------------------------------------------------------
% Die Vorgabe verwendet für einzelne Anhänge A.1, A.2, ...
\newlistof{appendices}{loa}{\TemplateAppendixListTitle}
\setlength{\cftappendicesnumwidth}{3.5em}

\newcounter{appendixentrycounter}
\renewcommand{\theappendixentrycounter}{A.\arabic{appendixentrycounter}}

% Fügt einen einzelnen Anhang mit der Nummer A.1, A.2, ... hinzu.
% Die Einträge erscheinen automatisch im Anhangsverzeichnis.
\newcommand{\appendixentry}[1]{%
  \refstepcounter{appendixentrycounter}%
  \phantomsection
  \addcontentsline{loa}{appendices}{%
    \protect\numberline{\theappendixentrycounter}#1%
  }%
  \section*{\theappendixentrycounter\quad #1}%
}

% Hyperref möglichst spät laden.
\RequirePackage[
  hidelinks,
  breaklinks=true,
  colorlinks=false,
  allcolors=blue
]{hyperref}

% ---------------------------------------------------------------------------
% Lokale Pakete
% ---------------------------------------------------------------------------
\RequirePackage{packages/FLaAL}
\RequirePackage{packages/tikz-uml}
\RequirePackage{packages/theorem-boxes}

\iftemplate@withmacros
  \RequirePackage{nwumacros}
\fi

% ---------------------------------------------------------------------------
% TikZ
% ---------------------------------------------------------------------------
\usetikzlibrary{
  arrows.meta,
  positioning,
  shapes.geometric,
  intersections
}

% ---------------------------------------------------------------------------
% Seitenlayout
% ---------------------------------------------------------------------------
\RequirePackage{geometry}
\geometry{
  a4paper,
  top=\TemplateMarginTop,
  bottom=\TemplateMarginBottom,
  left=\TemplateMarginLeft,
  right=\TemplateMarginRight
}

% Vorgabe: einzeilig, Blocksatz.
% Blocksatz ist LaTeX-Standard; setspace erzwingt den einzeiligen Satz.
\AtBeginDocument{\singlespacing}

% Vorgabe: Fußnoten 9 pt.
\renewcommand{\footnotesize}{\fontsize{9pt}{11pt}\selectfont}

\setlength{\parindent}{0pt}
\setlength{\parskip}{\TemplateParagraphSpacing}
\setlength{\intextsep}{6pt}

\addto\extrasngerman{%
  \def\figureautorefname{Abbildung}%
}

% Nummerierung: 1, 1.1, 1.1.1
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% Abbildungen und Tabellen werden dokumentweit als 1, 2, 3 ... nummeriert
% (nicht 1.1, 1.2 ...), passend zur Vorgabe "Abb. 1" / "Tab. 1".
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}

% "Abb. 1:" und "Tab. 1:"
\captionsetup[figure]{
  name=Abb.,
  labelsep=colon,
  position=top,
  skip=\TemplateCaptionContentGap
}
\captionsetup[table]{
  name=Tab.,
  labelsep=colon,
  position=top,
  skip=\TemplateCaptionContentGap
}

% Auch in den Verzeichnissen soll "Abb." bzw. "Tab." vor der Nummer stehen.
\renewcommand{\cftfigpresnum}{Abb.~}
\setlength{\cftfignumwidth}{4.2em}
\renewcommand{\cfttabpresnum}{Tab.~}
\setlength{\cfttabnumwidth}{4.2em}

% Einheitlicher Quellenhinweis unter Abbildungen/Tabellen.
\newcommand{\source}[1]{%
  \par
  \vspace{0pt}
  {\fontsize{9pt}{11pt}\selectfont Quelle: #1\par}
}

% ---------------------------------------------------------------------------
% Kapitel und Abschnitte
% ---------------------------------------------------------------------------
% Die Vorgabe zeigt die Nummer und Überschrift in einer Zeile:
% 1 Projektbeschreibung
% 1.1 Projektumfeld
% 1.1.1 ...
\titleclass{\chapter}{straight}

\titleformat{\chapter}[hang]
  {\normalfont\bfseries\normalsize}
  {\thechapter}
  {0.75em}
  {}

\titlespacing*{\chapter}
  {0pt}
  {12pt}
  {6pt}

\AddToHook{cmd/chapter/before}{%
  \Needspace{6\baselineskip}%
}

\titleformat{\section}[hang]
  {\normalfont\bfseries\normalsize}
  {\thesection}
  {0.75em}
  {}

\titlespacing*{\section}
  {0pt}
  {8pt}
  {4pt}

\titleformat{\subsection}[hang]
  {\normalfont\bfseries\normalsize}
  {\thesubsection}
  {0.75em}
  {}

\titlespacing*{\subsection}
  {0pt}
  {6pt}
  {3pt}


\titleformat{\subsubsection}[hang]
  {\normalfont\bfseries\normalsize}
  {\thesubsubsection}
  {0.75em}
  {}

\titlespacing*{\subsubsection}
  {0pt}
  {6pt}
  {3pt}

% ---------------------------------------------------------------------------
% Zusätzliche Programmiersprachen für Quellcode
% ---------------------------------------------------------------------------
% Bestehende listings-Sprachen wie Java, C, C++, Python, SQL, XML usw.
% können direkt verwendet werden. Für häufig benötigte Varianten gibt es
% folgende zusätzliche Namen.

\lstdefinelanguage{CSharp}{
  language=[Sharp]C,
  sensitive=true
}

\lstdefinelanguage{JavaScript}{
  morekeywords={
    break,case,catch,class,const,continue,debugger,default,delete,do,else,
    export,extends,finally,for,function,if,import,in,instanceof,let,new,
    return,super,switch,this,throw,try,typeof,var,void,while,with,yield,
    async,await,of
  },
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]",
  morestring=[b]',
  sensitive=true
}

\lstdefinelanguage{TypeScript}{
  language=JavaScript,
  morekeywords={
    interface,type,enum,namespace,implements,private,public,protected,
    readonly,abstract,declare,keyof,unknown,never,any,string,number,
    boolean,object,undefined,null
  }
}

\lstdefinelanguage{JSON}{
  morestring=[b]",
  morekeywords={true,false,null},
  sensitive=true
}

% ---------------------------------------------------------------------------
% Listings
% ---------------------------------------------------------------------------
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codeblue}{rgb}{0.1,0.1,0.6}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codebg}{rgb}{0.97,0.97,0.97}
\definecolor{codeorange}{rgb}{0.9,0.5,0}
\definecolor{branchorange}{rgb}{1,0.5,0.0}

\lstdefinestyle{mystyle}{
  backgroundcolor=\color{codebg},
  frame=single,
  rulecolor=\color{black},
  basicstyle=\ttfamily\small,
  keywordstyle=\color{codeblue}\bfseries,
  commentstyle=\color{codegreen}\itshape,
  stringstyle=\color{codegray},
  showstringspaces=false,
  numberstyle=\tiny\color{codegray},
  numbers=left,
  numbersep=10pt,
  breaklines=true,
  tabsize=2,
  captionpos=b
}

\lstdefinestyle{asmstyle}{
  backgroundcolor=\color{codebg},
  frame=single,
  rulecolor=\color{black},
  basicstyle=\ttfamily\small,
  keywordstyle=[1]\color{codeblue}\bfseries,
  keywordstyle=[2]\color{purple}\bfseries,
  keywordstyle=[3]\color{orange}\bfseries,
  keywordstyle=[4]\color{blue}\bfseries,
  keywordstyle=[5]\color{branchorange}\bfseries,
  keywordstyle=[6]\color{red}\bfseries,
  commentstyle=\color{codegreen}\itshape,
  stringstyle=\color{codegray},
  showstringspaces=false,
  numberstyle=\tiny\color{codegray},
  numbers=left,
  numbersep=10pt,
  breaklines=false,
  tabsize=8,
  columns=fixed,
  captionpos=b
}

\lstdefinelanguage{C}{
  language=C,
  morekeywords={printf, return, int, void, char},
  sensitive=true
}

\lstdefinelanguage{Java}{
  morekeywords=[1]{},
  morekeywords=[2]{void,int,char,double,float,byte,String,Integer,Number,Double,Object,super},
  morekeywords=[3]{class,private,final,this,return,public,@Override,abstract,implements,extends,new,var,static,if,else,null},
  morekeywords=[4]{E,T,F,S},
  morecomment=[l]{//},
  morestring=[b]",
  morestring=[b]',
  sensitive=true,
  literate=
    *{0}{{{\color{codeblue}0}}}{1}
     {1}{{{\color{codeblue}1}}}{1}
     {2}{{{\color{codeblue}2}}}{1}
     {3}{{{\color{codeblue}3}}}{1}
     {4}{{{\color{codeblue}4}}}{1}
     {5}{{{\color{codeblue}5}}}{1}
     {6}{{{\color{codeblue}6}}}{1}
     {7}{{{\color{codeblue}7}}}{1}
     {8}{{{\color{codeblue}8}}}{1}
     {9}{{{\color{codeblue}9}}}{1}
     {.0}{{{\color{codeblue}.0}}}{2}
     {.1}{{{\color{codeblue}.1}}}{2}
     {.2}{{{\color{codeblue}.2}}}{2}
     {.3}{{{\color{codeblue}.3}}}{2}
     {.4}{{{\color{codeblue}.4}}}{2}
     {.5}{{{\color{codeblue}.5}}}{2}
     {.6}{{{\color{codeblue}.6}}}{2}
     {.7}{{{\color{codeblue}.7}}}{2}
     {.8}{{{\color{codeblue}.8}}}{2}
     {.9}{{{\color{codeblue}.9}}}{2}
     {?}{{{\color{blue}?}}}{1}
     {R0}{{{\color{codeblue}0}}}{1}
     {Ä}{{\"A}}1
     {Ö}{{\"O}}1
     {Ü}{{\"U}}1
     {ä}{{\"a}}1
     {ö}{{\"o}}1
     {ü}{{\"u}}1
     {ß}{{\ss}}1
}

\lstdefinelanguage{PAP}{
  language=Java,
  morekeywords={if,fi,then},
  morekeywords=[3]{i},
  sensitive=true
}

\lstdefinelanguage{assembler}{
  morekeywords=[1]{MOV,ADD,SUB,INC,DEC,JMP,CMP,JE,JNE,INT,RET,PUSH,POP,section,global,BNE,jal,jr,addi,sw,beq,lw,mulh,mul,mv,bne,li,sub,slti,bnez,add,MUL,LOAD,load},
  morekeywords=[2]{Exit,Else,If,Loop,procA,Fak,Ret1,Ret,Error},
  morekeywords=[3]{sp,fp,wp,ra},
  morekeywords=[4]{a0,a1,t0,t1,t2,t3,t4,s1,s2,R1,R2,R3,R4,R5,R6,R7,R8,R9,R0},
  morekeywords=[5]{S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10},
  morekeywords=[6]{a,b,c},
  morecomment=[l]{\#},
  sensitive=true,
  literate=
    *{*R1*}{{{\color{red}R1}}}{2}
     {Ä}{{\"A}}1
     {Ö}{{\"O}}1
     {Ü}{{\"U}}1
     {ä}{{\"a}}1
     {ö}{{\"o}}1
     {ü}{{\"u}}1
     {ß}{{\ss}}1
}

\lstnewenvironment{assembler}[1][]{
  \lstset{
    language=assembler,
    style=asmstyle,
    #1
  }
}{}

\lstnewenvironment{java}[1][]{
  \lstset{
    language=Java,
    style=asmstyle,
    #1
  }
}{}

\lstnewenvironment{pap}[1][]{
  \lstset{
    language=PAP,
    style=asmstyle,
    #1
  }
}{}

\lstnewenvironment{cprog}[1][]{
  \lstset{
    language=C,
    style=mystyle,
    #1
  }
}{}

\lstset{style=mystyle}

% ---------------------------------------------------------------------------
% Dokument-Quellcode
% ---------------------------------------------------------------------------
% Sprache, Beschreibung und Quelle sind Pflichtparameter:
%
% \begin{documentcode}{CSharp}{Initialisierung des App SDK}{Eigene Darstellung}
% ...
% \end{documentcode}
%
% Die Beschreibung verwendet exakt dieselbe Caption-Formatierung wie normale
% Abbildungen und wird automatisch ins Abbildungsverzeichnis übernommen.
\lstnewenvironment{documentcode}[3]{%
  \def\documentcodesource{#3}%
  \captionof{figure}{#2}%
  \lstset{
    language=#1,
    style=mystyle,
    frame=single,
    aboveskip=\TemplateCaptionContentGap,
    belowskip=1pt
  }%
}{%
  \vspace{-\parskip}%
  \source{\documentcodesource}%
}

% ---------------------------------------------------------------------------
% Einheitliches Titelblatt
% ---------------------------------------------------------------------------
\makeatletter

\newcommand{\template@subtitle}{}
\newcommand{\template@matrikelnummer}{}
\newcommand{\template@fachbereich}{}
\newcommand{\template@studiengang}{}
\newcommand{\template@semester}{}
\newcommand{\template@titleimage}{}
\newcommand{\template@titleimagewidth}{0.75\linewidth}

\newcommand{\subtitle}[1]{\gdef\template@subtitle{#1}}
\newcommand{\matrikelnummer}[1]{\gdef\template@matrikelnummer{#1}}
\newcommand{\fachbereich}[1]{\gdef\template@fachbereich{#1}}
\newcommand{\studiengang}[1]{\gdef\template@studiengang{#1}}
\newcommand{\semester}[1]{\gdef\template@semester{#1}}
\newcommand{\titleimage}[1]{\gdef\template@titleimage{#1}}
\newcommand{\titleimagewidth}[1]{\gdef\template@titleimagewidth{#1}}

\renewcommand{\maketitle}{%
  \begin{titlepage}
    \centering

    \vspace*{2cm}

    {\LARGE\bfseries \@title\par}

    \ifdefempty{\template@subtitle}{}{%
      \vspace{0.5cm}
      {\Large\bfseries \template@subtitle\par}
    }

    \ifdefempty{\template@titleimage}{}{%
      \vspace{1.5cm}
      \includegraphics[
        width=\template@titleimagewidth
      ]{\template@titleimage}
    }

    \vfill

    \ifdefempty{\@author}{}{%
      {\large
        \@author\\
        \ifdefempty{\template@matrikelnummer}{}{%
          Matrikelnummer: \template@matrikelnummer\\
        }%
      \par}
    }

    \ifboolexpr{
      not test {\ifdefempty{\template@fachbereich}}
      or
      not test {\ifdefempty{\template@studiengang}}
    }{%
      \vspace{0.75cm}
      {\large
        \ifdefempty{\template@fachbereich}{}{%
          Fachbereich \template@fachbereich\\
        }%
        \ifdefempty{\template@studiengang}{}{%
          \template@studiengang
        }%
      \par}
    }{}

    \ifdefempty{\template@semester}{}{%
      \vspace{0.75cm}
      {\large \template@semester\par}
    }

    \vspace{2cm}
  \end{titlepage}
}

\makeatother

% ---------------------------------------------------------------------------
% Verzeichnisse und Dokumentstruktur
% ---------------------------------------------------------------------------

% Start des eigentlichen Hauptteils:
% arabische Seitennummerierung beginnt wieder bei 1.
\newcommand{\startdocument}{%
  \clearpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \pagestyle{plain}
}

% Deckblatt: keine sichtbare Seitennummer.
% Verzeichnisse: römisch; Inhaltsverzeichnis beginnt auf Seite II.
% Danach startet der Hauptteil automatisch bei Seite 1.
\newcommand{\makefrontmatter}{%
  \clearpage
  \pagenumbering{Roman}
  \setcounter{page}{\TemplateFrontMatterStartPage}
  \pagestyle{plain}

  \tableofcontents
  \thispagestyle{plain}
  \clearpage

  \phantomsection
  \addcontentsline{toc}{chapter}{\listfigurename}
  \listoffigures
  \thispagestyle{plain}
  \clearpage

  \phantomsection
  \addcontentsline{toc}{chapter}{\listtablename}
  \listoftables
  \thispagestyle{plain}
  \clearpage

  \phantomsection
  \addcontentsline{toc}{chapter}{Abkürzungsverzeichnis}
  \printacronyms[
    name=Abkürzungsverzeichnis,
    heading=chapter*
  ]
  \thispagestyle{plain}
  \clearpage

  \phantomsection
  \addcontentsline{toc}{chapter}{\TemplateAppendixListTitle}
  \listofappendices
  \thispagestyle{plain}

  \startdocument
}

% Literatur-/Quellenverzeichnis am Ende des Textteils.
% Titel kann oben in \TemplateBibliographyTitle geändert werden.
\newcommand{\printreferences}{%
  \clearpage
  \printbibliography[
    heading=bibintoc,
    title={\TemplateBibliographyTitle}
  ]
}

% Start des Anhangs.
% Das Kapitel "Anhang" bleibt Teil der normalen Kapitelnummerierung.
% Einzelne Anhänge werden anschließend mit \appendixentry{...}
% als A.1, A.2, ... nummeriert und automatisch ins Anhangsverzeichnis geschrieben.
\newcommand{\startappendices}{%
  \clearpage
  \chapter{Anhang}
  \setcounter{appendixentrycounter}{0}
}

\endinput
