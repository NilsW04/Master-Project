\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{customreport}[2025/05/06 Custom Report Class]

\LoadClass{report}

% --- Sprach- und Zeichencodierung ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}

% --- Kompakte Kapitelüberschriften ohne Seitenumbruch ---
\RequirePackage{titlesec}
\RequirePackage{needspace}

\RequirePackage{packages/FLaAL}
\RequirePackage{packages/theorem-boxes}
\RequirePackage{packages/tikz-uml}

\titleclass{\chapter}{straight}

\titleformat{\chapter}[display]
  {\normalfont\bfseries}
  {\large Kapitel~\thechapter}
  {0.3\baselineskip}
  {\LARGE}
  [\vspace{0.4\baselineskip}\titlerule]

\makeatletter
\titlespacing*{\chapter}
  {0pt}
  {2\baselineskip}
  {1\baselineskip}
\makeatother


\AddToHook{cmd/chapter/before}{%
  \Needspace{8\baselineskip}%
}


% --- Section --- %
\titleformat{\section}
  {\normalfont\large\bfseries}
  {\thesection}
  {0.75em}
  {}

\titlespacing*{\section}
  {0pt}
  {8pt}
  {4pt}

% --- Figurs --- %
\setlength{\intextsep}{6pt}

\addto\extrasngerman{%
    \def\figureautorefname{Abbildung}%
}


\setlength{\parindent}{0pt}
\setlength{\parskip}{3pt}

% --- Seitenlayout ---
\RequirePackage[
  a4paper,
  left=3.5cm,
  right=3.5cm,
  top=2.5cm,
  bottom=2.5cm
]{geometry}

% --- Allgemeine Pakete ---
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{tikz}
\RequirePackage{tikz-uml}
\RequirePackage{adigraph}
\RequirePackage{nwumacros} % lädt das echte .sty
\usepackage{float}
\usepackage{subcaption}
\usepackage[many]{tcolorbox}
\usepackage[utf8]{inputenc}
\usepackage{tcolorbox}
\usepackage{tocloft}
\usepackage{titlesec}
\usepackage{etoolbox}
\usepackage{algorithm}
\usepackage{algpseudocode}

\usepackage{ltablex}
\usepackage{pdflscape}

\def\quad{\hskip1em\relax}
\def\qquad{\hskip2em\relax}




\usepackage{soul}

\usepackage{amsmath, nccmath}
\usepackage{geometry}

% --- TikZ Bibliotheken ---
\usetikzlibrary{arrows.meta, positioning, shapes.geometric, intersections}

% --- Farben für Code ---
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codeblue}{rgb}{0.1,0.1,0.6}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codebg}{rgb}{0.97,0.97,0.97}
\definecolor{codeorange}{rgb}{0.9,0.5,0}
\definecolor{branchorange}{rgb}{1,0.5,0.0}


% --- Standard-Stil für Listings ---
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
  captionpos=b,
}

\lstset{style=mystyle} % Als Standard setzen

% --- Stil für Assembler ---
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

% --- Spracheinstellungen für Listings ---
\lstdefinelanguage{C}{
  language=C,
  morekeywords={printf, return, int, void, char},
  sensitive=true
}

\lstdefinelanguage{Java}{
  morekeywords=[1]{},
  morekeywords=[2]{void,int, char, double, float, byte, String, Integer, Number, Double, Object, super},
  morekeywords=[3]{class, private, final, this, return, public, @Override, abstract, implements, extends, new, var, static, if, else, null},
  morekeywords=[4]{E, T, F, S},
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
  morekeywords={if, fi, then},
  morekeywords=[3]{i},
  sensitive=true
}

\lstdefinelanguage{assembler}{
  morekeywords=[1]{MOV,ADD,SUB,INC,DEC,JMP,CMP,JE,JNE,INT,RET,PUSH,POP,section,global,BNE,jal,jr,addi,sw,beq,lw,mulh,mul,mv,bne,li,sub,slti,bnez,add,MUL,mul,LOAD,load},
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


% --- Umgebungen für verschiedene Sprachen ---
\lstnewenvironment{assembler}[1][]{
  \lstset{
    language=Assembler,
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

