return{
s(
    {trig = "phy-art", dscr = "Physics article"},
    fmta(
    [[
	\documentclass[letterpaper,11pt]{article}
	\usepackage[left=1.6cm,right=1.6cm,top=2.5cm,bottom=2.5cm,headheight=1.0cm]{geometry}
	\usepackage[activeacute,spanish,es-tabla]{babel}
	\usepackage[utf8]{inputenc}
	\usepackage{amsthm}
	\usepackage[tbtags]{amsmath}
	\usepackage{amssymb}
	\usepackage{enumitem}
	\usepackage{siunitx}
	\usepackage{tikz}
	\usepackage{pgfplots}
	\usepackage{wrapfig}
	\usepackage{multirow}
	\usepackage{array}
	\usepackage{multicol}
	\usepackage{float}
	\usepackage[hyphens]{url}
	\usepackage[hidelinks]{hyperref}
	\usepackage{bookmark}
	\usepackage[nottoc]{tocbibind}
	\usepackage{cleveref}
	\usepackage{caption}
	\usepackage{natbib}
	\usepackage{titling}
	\usepackage{setspace}
	\usepackage{esvect}
	\usepackage{cellspace}
	\usepackage{makecell}
	\usepackage{fancyhdr}
	\usepackage{titlesec}
	%\usepackage{lipsum}

	%Math
	\decimalpoint
	\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}
	\numberwithin{equation}{section}

	%Diagrams and plots
	\pgfplotsset{compat=1.18,ytick style={draw=none},xtick style={draw=none},width=9.0cm,height=8.3cm}

	%Bibliography and citations
	\setcitestyle{square,comma,numbers,sort}

	%Formatting
	\hypersetup{breaklinks=true}
	\titlespacing*{\section}{0pt}{0.2cm}{0.1cm}
	\titlespacing*{\subsection}{0pt}{0.2cm}{0.1cm}
	\titleformat{\section}{\centering\large\scshape}{\thesection.}{0.5em}{}
	\titleformat{\subsection}{\centering\normalsize\scshape}{\thesubsection.}{0.5em}{}

	%Layout
	\setlength{\textfloatsep}{0.1cm}
	\allowdisplaybreaks
	%\linespread{1.2}
	\setlength\parindent{0pt}
	\setlength\columnsep{0.5cm}
	\setlength{\parskip}{0.35cm}
	\renewcommand{\headruleskip}{2mm}

	%Tables
	\cellspacetoplimit 11pt
	\cellspacebottomlimit 10pt

	%fancyhdr

	\fancypagestyle{first}{
		\fancyheadoffset{0.8cm}
		\pagestyle{fancy}
		\fancyhf{}
		\rhead{\thepage\hspace{0.8cm}}
		\lhead{\hspace{0.8cm} <>}
	}

	\pagestyle{fancy}{
		\fancyhf{}
		\rhead{\thepage\hspace{0.8cm}}
		\lhead{\hspace{0.8cm} <>}
	}

	%Metadata

	\title{\vspace{-2.0cm}\Huge <>\vspace{-0.6cm}}
	%\date{\today}
	\author{\normalsize <>}
	\date{\vspace{-1.5cm}}
	%\hypersetup{
		%pdftitle={},
		%pdfsubject={},
		%pdfauthor={},
		%pdfkeywords={}
	%}

	%Macros

	%Operators
	\DeclarePairedDelimiter\bra{\langle}{\rvert}
	\DeclarePairedDelimiter\ket{\lvert}{\rangle}
	\DeclarePairedDelimiterX\braket[2]{\langle}{\rangle}{#1\,\delimsize\vert\,\mathopen{}#2}

	%Trigonometric functions
	\DeclareMathOperator{\arccot}{arccot}
	\DeclareMathOperator{\arcsec}{arcsec}
	\DeclareMathOperator{\arccsc}{arccsc}
	\DeclareMathOperator{\sech}{sech}
	\DeclareMathOperator{\csch}{csch}
	\DeclareMathOperator{\arcsinh}{arcsinh}
	\DeclareMathOperator{\arccosh}{arccosh}
	\DeclareMathOperator{\arctanh}{arctanh}
	\DeclareMathOperator{\arccoth}{arccoth}
	\DeclareMathOperator{\arcsech}{arcsech}
	\DeclareMathOperator{\arccsch}{arccsch}

	\begin{document}
	\maketitle
	\thispagestyle{first}
	\begin{multicols}{2}
	\begin{spacing}{0.85}
	\textbf{\small\textit{Abstract} -- <>}

	\textbf{\small\textit{Key terms} -- <>}
	\vspace{-0.2cm}
	\end{spacing}

	\section{<>}

	<>

	\end{multicols}
	\end{document}
    ]],
    {
        i(1),
        i(2),
        i(3),
        i(4),
        i(5),
        i(6),
        i(7),
        i(8)
    }
    )
),

s(
    {trig = "math-notes", dscr = "Math notes"},
    fmta(
    [[
		%! TeX root = main.tex
		\newcommand{\notestitle}{<>}
		\newcommand{\notesprof}{<>}
		\newcommand{\notesauthor}{<>}

		\input{../preamble.tex}

		\input{<>}

		\input{bibliography.tex}
    ]],
    {
        i(1,"Title"),
        i(2,"Profesor/course"),
        i(3,"Author"),
        i(4,"File")
    }
    )
),

s(
    {trig = "writing", dscr = "Writing"},
    fmta(
    [[
	\documentclass[letterpaper,twoside,11pt]{article}
	\usepackage[left=1.6cm,right=1.6cm,top=2.5cm,bottom=2.0cm,headheight=1.0cm]{geometry}
	\usepackage[activeacute,spanish,es-tabla]{babel}
	\usepackage[utf8]{inputenc}
	\usepackage[tbtags]{amsmath}
	\usepackage{amssymb}
	\usepackage{enumitem}
	\usepackage{multicol}
	\usepackage[hyphens]{url}
	\usepackage[hidelinks]{hyperref}
	\usepackage{bookmark}
	\usepackage[nottoc]{tocbibind}
	\usepackage{cleveref}
	\usepackage{natbib}
	\usepackage{ebgaramond}
	\usepackage{fancyhdr}
	\usepackage{titlesec}
	%\usepackage{lipsum}

	%Bibliography and citations
	\setcitestyle{square,comma,numbers,sort}

	%Math
	\decimalpoint
	\allowdisplaybreaks

	%Formatting

	\hypersetup{breaklinks=true}
	\titlespacing*{\section}{0pt}{0.2cm}{0.1cm}
	\titlespacing*{\subsection}{0pt}{0.2cm}{0.1cm}

	%titlesec
	\titleformat{\section}{\centering\large\scshape}{\thesection.}{0.5em}{}
	\titleformat{\subsection}{\centering\normalsize\scshape}{\thesubsection.}{0.5em}{}

	%Layout
	\setlength{\textfloatsep}{0.1cm}
	%\linespread{1.2}
	\setlength\parindent{0pt}
	\setlength\columnsep{0.5cm}
	\setlength{\parskip}{0.35cm}
	\renewcommand{\headruleskip}{2mm}

	%fancyhdr
	\fancypagestyle{first}
	{
		\fancyheadoffset{0.8cm}
		\pagestyle{fancy}
		\fancyhf{}
		\rhead{\thepage\hspace{0.8cm}}
		\lhead{\hspace{0.8cm}\scshape <>}
	}

	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[LO]{\hspace{0.8cm}\small\scshape $1}
	\fancyhead[RO]{\small\thepage\hspace{0.8cm}}
	\fancyhead[LE]{\hspace{0.8cm}\small\thepage}
	\fancyhead[RE]{\small\scshape\leftmark\hspace{0.8cm}}

	\begin{document}
	%\maketitle
	\thispagestyle{first}
	\begin{multicols}{2}

	\section{<>}

	<>

	\end{multicols}
	\end{document}
    ]],
    {
        i(1),
        i(2),
        i(3)
    }
    )
),

s(
    {trig = "bib", dscr = "Bibliography"},
    fmta(
    [[
        
        
        
        \phantomsection
        \bibliography{bibliography}
        \bibliographystyle{siam}
        \Urlmuskip=0mu plus 1mu\relax
        %\phantom{\cite{}}
    ]],
    {}
    )
),

s(
    {trig = "min-math", dscr = "Minimal math template"},
    fmta(
    [[
    \documentclass{article}
    \usepackage[utf8]{inputenc}
    \usepackage[tbtags]{amsmath}

    \title{<>}
    \author{<>}
    \date{\today}

    \begin{document}
    \maketitle

    <>

    \end{document}
    ]],
    {
        i(1),
        i(2),
        i(3)
    }
    )
),
}
