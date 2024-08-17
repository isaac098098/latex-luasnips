return{
s(
    {trig = "phy-art", dscr = "Physics article"},
    fmta(
    [[
	\documentclass[letterpaper,11pt]{article}
	\usepackage[left=1.6cm,right=1.6cm,top=2.5cm,bottom=2.5cm,headheight=1.0cm]{geometry} %Headheight controla la distancia de la regla del encabezado a su texto inferior
	\usepackage[utf8]{inputenc} %Formato de codificación
	\usepackage{amsthm} %Símbolos
	\usepackage[tbtags]{amsmath}
	\usepackage{amssymb} %Símbolos
	\usepackage{enumitem} %Listas
	\usepackage{siunitx} %Unidades del SI
	\usepackage{tikz} %Paquete tikz para diagramas
	\usepackage{pgfplots} %Gráficas
	\usepackage{wrapfig} %Insertar imágenes junto a párrafos
	\usepackage{multirow,array} %Multifilas para tablas
	\usepackage{multicol} %Multicolumnas
	\usepackage{float} %Comportamiento de tablas
	\usepackage[hyphens]{url} %URL's en referencias
	\usepackage[hidelinks]{hyperref} %Ocultar cajas de links
	\usepackage{bookmark} %Bookmarks
	\usepackage[nottoc]{tocbibind} %Referencias en el índice
	\usepackage{cleveref} %Nombres para captionof
	\usepackage{caption} %Descripciones
	\usepackage{natbib} %Referencias
	\usepackage{titling} %Abstract
	\usepackage{setspace} %Stretch para el abstract
	\usepackage{esvect} %Mejores flechas de vectores
	\usepackage{cellspace,makecell} %Necesario para el alineamiento Sc de tablas

	% Otros paquetes

	\usepackage[activeacute,spanish,es-tabla]{babel} %Acentos, 'Figura' para gráficas y 'Tabla' para tablas
	\usepackage{fancyhdr} %Línea horizontal del encabezado
	%\usepackage{booktabs} %Estilo de tablas
	\usepackage{titlesec} %Estilo de secciones
	%\usepackage{lipsum} %Texto de prueba
	%\usepackage{tabularx} %Saltos de línea en tablas

	% Matemáticas

	\decimalpoint %Usar punto decimal

	% Numeración

	\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}} %Numerar ecuación en align*
	\numberwithin{equation}{section} %Ecuaciones numeradas por sección

	% Gráficas

	\pgfplotsset{compat=1.18,ytick style={draw=none},xtick style={draw=none},width=9.0cm,height=8.3cm} %Tamaño de las gráficas

	% Referencias

	\setcitestyle{square,comma,numbers,sort} %Estilo de referencias

	% Layout

	\hypersetup{breaklinks=true} %Insertar saltos de línea en ULR's

	\setlength{\textfloatsep}{0.1cm} %Espacio entre objetos flotantes y texto
	\allowdisplaybreaks %Permitir saltos de página en modo matemático
	\makeatletter %Prevenir saltos de página en listas
	\def\adjustpenalty{\@beginparpenalty\@M \@itempenalty\@M}
	\makeatother 

	%\linespread{1.2} %Interlineado
	%\setlength\parindent{0pt} %Sangría de párrafos
	\setlength\columnsep{0.5cm} %Separación entre columnas
	\setlength{\parskip}{0.35cm} %Separación entre párrafos

	\titlespacing*{\section}{0pt}{0.2cm}{0.1cm} %Espaciado de las secciones
	\titlespacing*{\subsection}{0pt}{0.2cm}{0.1cm} %Espaciado de las subsecciones

	\renewcommand{\headruleskip}{2mm} %Distancia de la regla del encabezado a su texto superior
	\fancyheadoffset{0.8cm} %Desplazamiento a los laterales de la regla superior

	%Espaciado de tablas Sc
	\cellspacetoplimit 11pt
	\cellspacebottomlimit 10pt

	% Estilos

	%El primer argumento es la numeración de la sección, el segundo el espacio entre dicha numeración y el texto
	\titleformat{\section}{\centering\large\scshape}{\thesection.}{0.5em}{}
	\titleformat{\subsection}{\centering\normalsize\scshape}{\thesubsection.}{0.5em}{}

	% Regla superior

	%Estilo de encabezado y pie de página para la página "first"
	\fancypagestyle{first}
	{
	\pagestyle{fancy}
	\fancyhf{}
	\rhead{\thepage\hspace{0.8cm}}
	\lhead{\hspace{0.8cm} <>}
	}

	% Estilo de encabezado y pie de página para el documento completo
	\pagestyle{fancy}
	\fancyhf{}
	\rhead{\thepage\hspace{0.8cm}}
	\lhead{\hspace{0.8cm} <>}

	% Metadata

	\title{\vspace{-2.0cm}\Huge <>\vspace{-0.6cm}}
	%\date{\today}
	\author{\normalsize <>}
	\date{\vspace{-1.5cm}}
	\makeindex %Hacer el índice, no funciona con section*{}
	%\hypersetup{
	%pdftitle={},
	%pdfsubject={},
	%pdfauthor={},
	%pdfkeywords={}
	%}

	% Operators

	\DeclarePairedDelimiter\bra{\langle}{\rvert}
	\DeclarePairedDelimiter\ket{\lvert}{\rangle}
	\DeclarePairedDelimiterX\braket[2]{\langle}{\rangle}{#1\,\delimsize\vert\,\mathopen{}#2}

	% Trigonometric functions

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
	\documentclass[letterpaper,twoside]{article}
	\usepackage{anyfontsize} %Usar cualquier tamaño de letra
	\usepackage[fontsize=13pt]{scrextend} %Aumentar tamaño de letra
	\usepackage[left=3.0cm,right=3.0cm,top=3.0cm,bottom=2.5cm,headheight=0.8cm]{geometry} %Headheight controla la distancia de la regla del encabezado a su texto inferior
	\usepackage[utf8]{inputenc} %Formato de codificación
	\usepackage[activeacute,spanish,es-tabla,es-lcroman]{babel} %Acentos, 'Figura' para gráficas y 'Tabla' para tablas
	\usepackage{amsthm} %Teoremas
	\usepackage[tbtags]{amsmath}
	\usepackage{amssymb} %Símbolos
	\usepackage[hyphens]{url} %URL's en referencias
	\usepackage[hidelinks]{hyperref} %URL's
	\usepackage{bookmark} %Bookmarks
	\usepackage[nottoc]{tocbibind} %Referencias en el índice
	\usepackage{titlesec} %Estilo de secciones
	\usepackage{cleveref} %Nombres para captionof
	\usepackage{natbib} %Referencias
	\usepackage{enumitem} %Listas
	\usepackage{fancyhdr} %Línea horizontal del encabezado
	\usepackage{caption} %Descripciones
	\usepackage{float} %Comportamiento de tablas
	\usepackage[titles]{tocloft} %Formato de la tabla de contenidos, 'titles' es para centrar el título
	\usepackage{cellspace,makecell} %Necesario para el alineamiento Sc de tablas
	\usepackage[skip=0pt,tocskip=2pt,indent=0pt]{parskip} %Separación entre párrafos, separación entre secciones de la tabla de contenidos y sangría

	% Otros paquetes

	%\usepackage{tikz} %Paquete tikz para diagramas
	%\usepackage{pgfplots} %Gráficas
	\usepackage{multirow,array} %Multifilas para tablas
	\usepackage[activeacute,spanish,es-tabla]{babel} %Acentos, 'Figura' para gráficas y 'Tabla' para tablas
	\usepackage{fancyhdr} %Línea horizontal del encabezado
	%\usepackage{booktabs} %Estilo de tablas
	\usepackage{titlesec} %Estilo de secciones
	%\usepackage{lipsum} %Texto de prueba
	%\usepackage{libertine}
	%\usepackage[libertine]{newtxmath}
	%\usepackage{libertinust1math} %Deprecated
	%\usepackage{relsize} %Aumentar escala del documento completo
	%\usepackage{scalerel} %Aumentar tamaño de símbolos
	%\usepackage{centernot} %Para el símbolo "no divide"
	%\usepackage{leftindex} %Índices izquierdos
	%\usepackage{esvect} %Mejores flechas de vectores
	%\usepackage{statmath} %Negritas en modo matemático, /bf(any letter)
	%\usepackage{tabularx} %Saltos de línea en tablas

	% Matemáticas

	\decimalpoint %Usar punto decimal
	\renewcommand\qedsymbol{$\blacksquare$}

	% Numeración

	\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}} %Numerar ecuación en align*
	\numberwithin{equation}{section} %Ecuaciones numeradas por sección

	% Gráficas

	%\pgfplotsset{compat=1.18,ytick style={draw=none},xtick style={draw=none},width=9.0cm,height=8.3cm} %Tamaño de las gráficas

	% Referencias

	\setcitestyle{square,comma,numbers,sort} %Estilo de referencias

	% Layout

	\hypersetup{breaklinks=true} %Insertar saltos de línea en ULR's

	\setlength{\textfloatsep}{0.1cm} %Espacio entre objetos flotantes y texto
	\allowdisplaybreaks %Permitir saltos de página en modo matemático
	\makeatletter %Prevenir saltos de página en listas
	\def\adjustpenalty{\@beginparpenalty\@M \@itempenalty\@M}
	\makeatother 

	\linespread{1} %Interlineado
	%\setlength\parindent{0pt} %Sangría de párrafos
	%\setlength\columnsep{0.5cm} %Separación entre columnas
	%\setlength{\parskip}{0.35cm} %Separación entre párrafos

	\titlespacing*{\section}{0pt}{0.6cm}{0.6cm} %Espaciado de las secciones
	\titlespacing*{\subsection}{0pt}{0.9cm}{0.4cm} %Espaciado de las subsecciones

	\renewcommand{\headruleskip}{2mm} %Distancia de la regla del encabezado a su texto superior
	\fancyheadoffset{0.8cm} %Desplazamiento a los laterales de la regla superior

	%Espaciado de tablas Sc
	\cellspacetoplimit 11pt
	\cellspacebottomlimit 10pt

	% Estilos

	%El primer argumento es la numeración de la sección, el segundo el espacio entre dicha numeración y el texto
	\titleformat{\section}{\centering\large\scshape}{\thesection.}{0.5em}{}
	\titleformat{\subsection}{\centering\normalsize\scshape}{\thesubsection.}{0.5em}{}

	% Regla superior

	% Estilo de encabezado y pie de página para el documento completo
	\pagestyle{fancy}
	\fancyhf{}
	%\rhead{\thepage\hspace{0.6cm}}
	%\lhead{\hspace{0.6cm} Espacios topológicos}

	\fancyhead[LO]{\hspace{0.8cm}\small\scshape\nouppercase <>}
	\fancyhead[RO]{\small\thepage\hspace{0.8cm}}
	\fancyhead[LE]{\hspace{0.8cm}\small\thepage}
	\fancyhead[RE]{\small\scshape\nouppercase\leftmark\hspace{0.8cm}}
	\fancypagestyle{plain} %Estilo de encabezado y pie de página para la página "plain"
	{
		\fancyhf{}
		\renewcommand{\headrulewidth}{0pt}
		\cfoot{\thepage}
	}

	% Tabla de contenidos

	\addto{\captionsspanish}{\renewcommand{\contentsname}{\large Índice general}} %Título
	\renewcommand{\cfttoctitlefont}{\scshape\Large} %Estilo del título
	\renewcommand{\cftsecfont}{\itshape} %Estilo del título de las secciones
	\renewcommand{\cftsecpagefont}{} %Estilo del título de las secciones de la página
	\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} %Puntos para las secciones
	\renewcommand{\cftsecaftersnum}{.} %Punto después del número de la sección
	\renewcommand{\cftsubsecaftersnum}{.} %Punto después del número de la subsección
	\renewcommand{\thesection}{\arabic{section}} %Formato de las secciones
	\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}} %Formato de las subsecciones
	%\renewcommand{\thesection}{\Roman{section}} %Formato de las secciones
	%\renewcommand{\thesubsection}{\Roman{section}.\arabic{subsection}} %Formato de las subsecciones
	%\renewcommand{\cftsecafterpnum}{\vskip2pt} %Separación entre secciones
	\addtocontents{toc}{\vspace{-0.5cm}} %Espacio después del título

	% Referencias

	%\addto{\captionsspanish}{\renewcommand{\bibname}{Bibliografía}}
	\addto{\captionsspanish}{\renewcommand{\refname}{Bibliografía}} %Título

	% Metadata

	\title{\vspace{-1.3cm}\Huge\scshape <>\vspace{-0.6cm}}
	%\date{\today}
	\author{\normalsize <>. \textit{ESFM-IPN}}
	\date{\vspace{-1.0cm}}
	\makeindex %Hacer el índice, no funciona con section*{}
	%\hypersetup{
	%pdftitle={},
	%pdfsubject={},
	%pdfauthor={},
	%pdfkeywords={}
	%}

	% Operators

	\DeclarePairedDelimiter\bra{\langle}{\rvert}
	\DeclarePairedDelimiter\ket{\lvert}{\rangle}
	\DeclarePairedDelimiterX\braket[2]{\langle}{\rangle}{#1\,\delimsize\vert\,\mathopen{}#2}

	% Trigonometric functions

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

	% Logic

	\let\oldforall\forall
	\renewcommand{\forall}{\:\oldforall\,}
	\let\oldexists\exists
	\renewcommand{\exists}{\:\oldexists\:}
	\let\oldnexists\nexists
	\renewcommand{\nexists}{\:\oldnexists\:}

	% Sets and inclusion

	\newcommand{\std}{\, : \,}
	
	% Derivatives

	\newcommand{\dx}{\,\text{d}}
	\newcommand{\dr}{\text{d}}
	\newcommand{\der}[2]{\frac{\dr#1}{\dr#2}}
	\newcommand{\Der}[2]{\frac{\dr}{\dr#2}#1}
	\newcommand{\ndr}[3]{\frac{\dr^{#1}#2}{\dr#3^{#1}}}
	\newcommand{\Ndr}[3]{\frac{\dr^{#1}}{\dr#3^{#1}}#2}
	\newcommand{\pdr}[2]{\frac{\partial#1}{\partial#2}}
	\newcommand{\Pdr}[2]{\frac{\partial}{\partial#2}#1}
	\newcommand{\npd}[3]{\frac{\partial^{#1}#2}{\partial#3^{#1}}}
	\newcommand{\Npd}[3]{\frac{\partial^{#1}}{\partial#3^{#1}}#2}
	\newcommand{\evl}[1]{\mathrel{\bigg|_{#1}}}

	%\let\oldcap\cap
	%\renewcommand{\cap}{\mathbin{\scaleobj{1.1}{\oldcap}}}
	%\let\oldcup\cup
	%\renewcommand{\cup}{\mathbin{\scaleobj{1.1}{\oldcup}}}

	%\let\oldpartial\partial
	%\renewcommand{\partial}{\mathbin{\scaleobj{1.15}{\oldpartial}}}

	%\let\oldsubset\subset
	%\renewcommand{\subset}{\mathbin{\scaleobj{1.15}{\oldsubset}}}

	%\let\oldsubset\subset
	%\renewcommand{\subset}{\mathbin{\scaleobj{1.1}{\oldsubset}}}
	%\let\oldsubseteq\subseteq
	%\renewcommand{\subseteq}{\mathbin{\scaleobj{1.1}{\oldsubseteq}}}

	%\let\oldsupset\supset
	%\renewcommand{\supset}{\mathbin{\scaleobj{1.1}{\oldsupset}}}
	%\let\oldsupseteq\supseteq
	%\renewcommand{\supseteq}{\mathbin{\scaleobj{1.1}{\oldsupseteq}}}

	% Teoremas
	\newtheoremstyle{theorem}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Teorema [número] [nombre]
	\theoremstyle{theorem}
	\newtheorem{theorem}{Teorema}[section]

	\newtheoremstyle{proposition}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Proposición [número] [nombre]
	\theoremstyle{proposition}
	\newtheorem{proposition}{Proposición}[section]

	\newtheoremstyle{corollary}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Corolario[número] [nombre]
	\theoremstyle{corollary}
	\newtheorem{corollary}{Corolario}[section]

	\newtheoremstyle{lemma}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Lema [número] [nombre]
	\theoremstyle{lemma}
	\newtheorem{lemma}{Lema}[section]

	\newtheoremstyle{definition}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Definición [número] [nombre]
	\theoremstyle{definition}
	\newtheorem{definition}{Definición}[section]

	\newtheoremstyle{remark}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\rmfamily} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Observación [número] [nombre]
	\theoremstyle{remark}
	\newtheorem{remark}{Observación}[section]

	\newtheoremstyle{exercise}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\rmfamily} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Ejercicio [número] [nombre]
	\theoremstyle{exercise}
	\newtheorem{exercise}{Ejercicio}[section]

	\newtheoremstyle{example}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\rmfamily} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Ejemplo [número] [nombre]
	\theoremstyle{example}
	\newtheorem{example}{Ejemplo}[section]

	\begin{document}
	\maketitle
	\tableofcontents

	\newpage
	\thispagestyle{plain}
	\mbox{}
	\newpage

	\section{<>}

	<>

	\end{document}
    ]],
    {
        i(1),
        rep(1),
        i(2),
        i(3),
        i(4),
    }
    )
),

s(
    {trig = "math-ex", dscr = "Math exercises"},
    fmta(
    [[
	\documentclass[letterpaper,twoside]{article}
	\usepackage{anyfontsize} %Usar cualquier tamaño de letra
	\usepackage[fontsize=13pt]{scrextend} %Aumentar tamaño de letra
	\usepackage[left=3.0cm,right=3.0cm,top=3.0cm,bottom=2.5cm,headheight=0.8cm]{geometry} %Headheight controla la distancia de la regla del encabezado a su texto inferior
	\usepackage[utf8]{inputenc} %Formato de codificación
	\usepackage[activeacute,spanish,es-tabla,es-lcroman]{babel} %Acentos, 'Figura' para gráficas y 'Tabla' para tablas
	\usepackage[tbtags]{amsmath}
	\usepackage{amsmath} %Símbolos
	\usepackage{amssymb} %Símbolos
	\usepackage[hyphens]{url} %URL's en referencias
	\usepackage[hidelinks]{hyperref} %URL's
	\usepackage{bookmark} %Bookmarks
	\usepackage[nottoc]{tocbibind} %Referencias en el índice
	\usepackage{titlesec} %Estilo de secciones
	\usepackage{cleveref} %Nombres para captionof
	\usepackage{natbib} %Referencias
	\usepackage{enumitem} %Listas
	\usepackage{fancyhdr} %Línea horizontal del encabezado
	\usepackage{caption} %Descripciones
	\usepackage{float} %Comportamiento de tablas
	\usepackage[titles]{tocloft} %Formato de la tabla de contenidos, 'titles' es para centrar el título
	\usepackage[skip=0pt,tocskip=2pt,indent=0pt]{parskip} %Separación entre párrafos, separación entre secciones de la tabla de contenidos y sangría

	% Otros paquetes

	%\usepackage{tikz} %Paquete tikz para diagramas
	%\usepackage{pgfplots} %Gráficas
	\usepackage{multirow,array} %Multifilas para tablas
	\usepackage[activeacute,spanish,es-tabla]{babel} %Acentos, 'Figura' para gráficas y 'Tabla' para tablas
	\usepackage{fancyhdr} %Línea horizontal del encabezado
	%\usepackage{booktabs} %Estilo de tablas
	\usepackage{titlesec} %Estilo de secciones
	%\usepackage{lipsum} %Texto de prueba
	%\usepackage{libertine}
	%\usepackage[libertine]{newtxmath}
	%\usepackage{libertinust1math} %Deprecated
	%\usepackage{relsize} %Aumentar escala del documento completo
	%\usepackage{scalerel} %Aumentar tamaño de símbolos
	\usepackage{cellspace,makecell} %Necesario para el alineamiento Sc de tablas
	%\usepackage{centernot} %Para el símbolo "no divide"
	%\usepackage{leftindex} %Índices izquierdos
	%\usepackage{esvect} %Mejores flechas de vectores
	%\usepackage{tabularx} %Saltos de línea en tablas

	% Matemáticas

	\decimalpoint %Usar punto decimal
	\renewcommand\qedsymbol{$\blacksquare$}

	% Numeración

	\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}} %Numerar ecuación en align*
	\numberwithin{equation}{section} %Ecuaciones numeradas por sección

	% Gráficas

	%\pgfplotsset{compat=1.18,ytick style={draw=none},xtick style={draw=none},width=9.0cm,height=8.3cm} %Tamaño de las gráficas

	% Referencias

	\setcitestyle{square,comma,numbers,sort} %Estilo de referencias

	% Layout

	\hypersetup{breaklinks=true} %Insertar saltos de línea en ULR's

	\setlength{\textfloatsep}{0.1cm} %Espacio entre objetos flotantes y texto
	\allowdisplaybreaks %Permitir saltos de página en modo matemático
	\makeatletter %Prevenir saltos de página en listas
	\def\adjustpenalty{\@beginparpenalty\@M \@itempenalty\@M}
	\makeatother 

	\linespread{1} %Interlineado
	%\setlength\parindent{0pt} %Sangría de párrafos
	%\setlength\columnsep{0.5cm} %Separación entre columnas
	%\setlength{\parskip}{0.35cm} %Separación entre párrafos

	\titlespacing*{\section}{0pt}{0.6cm}{0.6cm} %Espaciado de las secciones
	\titlespacing*{\subsection}{0pt}{0.9cm}{0.4cm} %Espaciado de las subsecciones

	\renewcommand{\headruleskip}{2mm} %Distancia de la regla del encabezado a su texto superior
	\fancyheadoffset{0.8cm} %Desplazamiento a los laterales de la regla superior

	%Espaciado de tablas Sc
	\cellspacetoplimit 11pt
	\cellspacebottomlimit 10pt

	% Estilos

	%El primer argumento es la numeración de la sección, el segundo el espacio entre dicha numeración y el texto
	\titleformat{\section}{\centering\large\scshape}{\thesection.}{0.5em}{}
	\titleformat{\subsection}{\centering\normalsize\scshape}{\thesubsection.}{0.5em}{}

	% Regla superior

	% Estilo de encabezado y pie de página para el documento completo
	\pagestyle{fancy}
	\fancyhf{}
	%\rhead{\thepage\hspace{0.6cm}}
	%\lhead{\hspace{0.6cm} Espacios topológicos}

	\fancyhead[LO]{\hspace{0.8cm}\small\scshape\nouppercase <>}
	\fancyhead[RO]{\small\thepage\hspace{0.8cm}}
	\fancyhead[LE]{\hspace{0.8cm}\small\thepage}
	\fancyhead[RE]{\small\scshape\nouppercase\leftmark\hspace{0.8cm}}

	\fancypagestyle{plain} %Estilo de encabezado y pie de página para la página "plain"
	{
		\fancyhf{}
		\renewcommand{\headrulewidth}{0pt}
		\cfoot{\thepage}
	}

	% Tabla de contenidos

	\addto{\captionsspanish}{\renewcommand{\contentsname}{\large Índice general}} %Título
	\renewcommand{\cfttoctitlefont}{\scshape\Large} %Estilo del título
	\renewcommand{\cftsecfont}{\itshape} %Estilo del título de las secciones
	\renewcommand{\cftsecpagefont}{} %Estilo del título de las secciones de la página
	\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} %Puntos para las secciones
	\renewcommand{\cftsecaftersnum}{.} %Punto después del número de la sección
	\renewcommand{\cftsubsecaftersnum}{.} %Punto después del número de la subsección
	\renewcommand{\thesection}{\arabic{section}} %Formato de las secciones
	\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}} %Formato de las subsecciones
	%\renewcommand{\thesection}{\normalfont\Roman{section}} %Formato de las secciones
	%\renewcommand{\thesubsection}{\Roman{section}.\arabic{subsection}} %Formato de las subsecciones
	%\renewcommand{\cftsecafterpnum}{\vskip2pt} %Separación entre secciones
	\addtocontents{toc}{\vspace{-0.5cm}} %Espacio después del título

	% Referencias

	%\addto{\captionsspanish}{\renewcommand{\bibname}{Bibliografía}}
	\addto{\captionsspanish}{\renewcommand{\refname}{Bibliografía}} %Título

	% Metadata

	\title{\vspace{-1.3cm}\Huge\scshape <>\vspace{-0.6cm}}
	%\date{\today}
	\author{\normalsize <>. \textit{ESFM-IPN}}
	\date{\vspace{-1.0cm}}
	\makeindex %Hacer el índice, no funciona con section*{}
	%\hypersetup{
	%pdftitle={},
	%pdfsubject={},
	%pdfauthor={},
	%pdfkeywords={}
	%}

	% Trigonometric functions

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
	
	% Logic

	\let\oldforall\forall
	\renewcommand{\forall}{\:\oldforall\,}
	\let\oldexists\exists
	\renewcommand{\exists}{\:\oldexists\:}
	\let\oldnexists\nexists
	\renewcommand{\nexists}{\:\oldnexists\:}

	% Sets and inclusion

	\newcommand{\std}{\, : \,}

	% Derivatives

	\newcommand{\dx}{\,\text{d}}
	\newcommand{\dr}{\text{d}}
	\newcommand{\der}[2]{\frac{\dr#1}{\dr#2}}
	\newcommand{\Der}[2]{\frac{\dr}{\dr#2}#1}
	\newcommand{\ndr}[3]{\frac{\dr^{#1}#2}{\dr#3^{#1}}}
	\newcommand{\Ndr}[3]{\frac{\dr^{#1}}{\dr#3^{#1}}#2}
	\newcommand{\pdr}[2]{\frac{\partial#1}{\partial#2}}
	\newcommand{\Pdr}[2]{\frac{\partial}{\partial#2}#1}
	\newcommand{\npd}[3]{\frac{\partial^{#1}#2}{\partial#3^{#1}}}
	\newcommand{\Npd}[3]{\frac{\partial^{#1}}{\partial#3^{#1}}#2}
	\newcommand{\evl}[1]{\mathrel{\bigg|_{#1}}}

	%\let\oldcap\cap
	%\renewcommand{\cap}{\mathbin{\scaleobj{1.1}{\oldcap}}}
	%\let\oldcup\cup
	%\renewcommand{\cup}{\mathbin{\scaleobj{1.1}{\oldcup}}}

	%\let\oldpartial\partial
	%\renewcommand{\partial}{\mathbin{\scaleobj{1.15}{\oldpartial}}}

	%\let\oldsubset\subset
	%\renewcommand{\subset}{\mathbin{\scaleobj{1.15}{\oldsubset}}}

	%\let\oldsubset\subset
	%\renewcommand{\subset}{\mathbin{\scaleobj{1.1}{\oldsubset}}}
	%\let\oldsubseteq\subseteq
	%\renewcommand{\subseteq}{\mathbin{\scaleobj{1.1}{\oldsubseteq}}}

	%\let\oldsupset\supset
	%\renewcommand{\supset}{\mathbin{\scaleobj{1.1}{\oldsupset}}}
	%\let\oldsupseteq\supseteq
	%\renewcommand{\supseteq}{\mathbin{\scaleobj{1.1}{\oldsupseteq}}}

	% Teoremas

	\newtheoremstyle{theorem}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Teorema [número] [nombre]
	\theoremstyle{theorem}
	\newtheorem{theorem}{Teorema}[section]

	\newtheoremstyle{proposition}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Proposición [número] [nombre]
	\theoremstyle{proposition}
	\newtheorem{proposition}{Proposición}[section]

	\newtheoremstyle{corollary}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Corolario[número] [nombre]
	\theoremstyle{corollary}
	\newtheorem{corollary}{Corolario}[section]

	\newtheoremstyle{lemma}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Lema [número] [nombre]
	\theoremstyle{lemma}
	\newtheorem{lemma}{Lema}[section]

	\newtheoremstyle{definition}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\itshape} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Definición [número] [nombre]
	\theoremstyle{definition}
	\newtheorem{definition}{Definición}[section]

	\newtheoremstyle{remark}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\rmfamily} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Observación [número] [nombre]
	\theoremstyle{remark}
	\newtheorem{remark}{Observación}[section]

	\newtheoremstyle{exercise}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\rmfamily} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Ejercicio [número] [nombre]
	\theoremstyle{exercise}
	\newtheorem{exercise}{Ejercicio}[section]

	\newtheoremstyle{example}
	{\topsep} %Separación superior
	{\topsep} %Separación inferior
	{\rmfamily} %Fuente del cuerpo
	{0em} %Sangría
	{\scshape} %Fuente del encabezado
	{.} %Puntuación después del encabezado
	{0.5em} %Espacio después del encabezado
	{\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}} %Ejemplo [número] [nombre]
	\theoremstyle{example}
	\newtheorem{example}{Ejemplo}[section]

	\begin{document}
	\maketitle
	\tableofcontents
	\newpage

	\section{<>}

	<>

	\end{document}
    ]],
    {
        i(1),
        rep(1),
        i(2),
        i(3),
        i(4),
    }
    )
),

s(
    {trig = "writing", dscr = "Writing"},
    fmta(
    [[
	\documentclass[letterpaper,twoside,11pt]{article}
	\usepackage[left=1.6cm,right=1.6cm,top=2.5cm,bottom=2.0cm,headheight=1.0cm]{geometry} %Headheight controla la distancia de la regla del encabezado a su texto inferior
	\usepackage[utf8]{inputenc} %Formato de codificación
	\usepackage[tbtags]{amsmath}
	\usepackage{amssymb} %Símbolos
	\usepackage{enumitem} %Listas
	\usepackage{multicol} %Multicolumnas
	\usepackage[hyphens]{url} %URL's en referencias
	\usepackage[hidelinks]{hyperref} %Ocultar cajas de links
	\usepackage{bookmark} %Bookmarks
	\usepackage[nottoc]{tocbibind} %Referencias en el índice
	\usepackage{cleveref} %Nombres para captionof
	\usepackage{natbib} %Referencias
	\usepackage{ebgaramond}

	% Otros paquetes

	\usepackage[activeacute,spanish,es-tabla]{babel} %Acentos, 'Figura' para gráficas y 'Tabla' para tablas
	\usepackage{fancyhdr} %Línea horizontal del encabezado
	\usepackage{titlesec} %Estilo de secciones
	%\usepackage{lipsum} %Texto de prueba

	% Matemáticas

	\decimalpoint %Usar punto decimal

	% Referencias

	\setcitestyle{square,comma,numbers,sort} %Estilo de referencias

	% Layout

	\hypersetup{breaklinks=true} %Insertar saltos de línea en ULR's

	\setlength{\textfloatsep}{0.1cm} %Espacio entre objetos flotantes y texto
	\allowdisplaybreaks %Permitir saltos de página en modo matemático
	\makeatletter %Prevenir saltos de página en listas
	\def\adjustpenalty{\@beginparpenalty\@M \@itempenalty\@M}
	\makeatother 

	%\linespread{1.2} %Interlineado
	\setlength\parindent{0pt} %Sangría de párrafos
	\setlength\columnsep{0.5cm} %Separación entre columnas
	\setlength{\parskip}{0.35cm} %Separación entre párrafos

	\titlespacing*{\section}{0pt}{0.2cm}{0.1cm} %Espaciado de las secciones
	\titlespacing*{\subsection}{0pt}{0.2cm}{0.1cm} %Espaciado de las subsecciones

	\renewcommand{\headruleskip}{2mm} %Distancia de la regla del encabezado a su texto superior
	\fancyheadoffset{0.8cm} %Desplazamiento a los laterales de la regla superior

	% Estilos

	%El primer argumento es la numeración de la sección, el segundo el espacio entre dicha numeración y el texto
	\titleformat{\section}{\centering\large\scshape}{\thesection.}{0.5em}{}
	\titleformat{\subsection}{\centering\normalsize\scshape}{\thesubsection.}{0.5em}{}

	% Regla superior

	%Estilo de encabezado y pie de página para la página "first"
	\fancypagestyle{first}
	{
		\pagestyle{fancy}
		\fancyhf{}
		\rhead{\thepage\hspace{0.8cm}}
		\lhead{\hspace{0.8cm}\scshape <>}
	}

	% Estilo de encabezado y pie de página para el documento completo
	\pagestyle{fancy}
	\fancyhf{}

	\fancyhead[LO]{\hspace{0.8cm}\small\scshape $1}
	\fancyhead[RO]{\small\thepage\hspace{0.8cm}}
	\fancyhead[LE]{\hspace{0.8cm}\small\thepage}
	\fancyhead[RE]{\small\scshape\leftmark\hspace{0.8cm}}

	% Metadata

	\title{\vspace{-2.0cm}\Huge $1\vspace{-0.6cm}}
	%\date{\today}
	\author{\normalsize <>}
	\date{\vspace{-1.5cm}}
	\makeindex %Hacer el índice, no funciona con section*{}
	\hypersetup{
	%pdftitle={},
	%pdfsubject={},
	%pdfauthor={},
	%pdfkeywords={}
	%}

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
        i(3),
        i(4),
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
