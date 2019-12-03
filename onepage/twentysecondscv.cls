\ProvidesClass{twentysecondscv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%PACKAGES%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax

\usetikzlibrary{calc}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB0B00}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{cerulean}{HTML}{007BA7}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{maindarkgray}{HTML}{B3B3B3}
\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{asidecolor}{sidecolor}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
  \colorlet{asidecolor}{sidecolor}
\fi


\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%
% Profile left SideBar %
%%%%%%%%%%%%%%%%

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%


\newcommand{\profilesection}[2]{ \vspace{7pt} {\noindent\color{black!80} \huge #1  \vspace{7pt} \rule[0.15\baselineskip]{#2}{1pt} \vspace{0pt}}}


\newcommand{\cvdate}[1]{\renewcommand{\givencvdate}{#1}}
\newcommand{\cvdateone}[1]{\renewcommand{\givencvdateone}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\givencvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\givennumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\givencvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\givencvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\givenaboutme}{ \noindent \justifying#1}}
\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}
\newcommand{\emptyspace}[1]{\renewcommand{\givenemptyspace}{ \noindent \justifying#1}}

\newcommand{\givencvname}{REQUIRED!}
\newcommand{\givencvdate}{}
\newcommand{\givencvmail}{}
\newcommand{\givennumberphone}{}
\newcommand{\givencvaddress}{} 
\newcommand{\givenaboutme}{}
\newcommand{\givenprofilepic}{}
\newcommand{\givencvsite}{}
\newcommand{\givencvjobtitle}{}



\newcommand*\icon[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt,minimum size=8.0mm, fill=cerulean,cerulean,text=white] (char) {#1};}}
\newcommand*\round[2]{%
  \tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm,
    text height=3.6mm,  fill=#2,#2,text=white](char){#1} ;}

\newcommand\skills[1]{ 

\renewcommand{\givenskill}{
\noindent
\begin{tikzpicture}
\foreach [count=\i] \x/\y in {#1}
{
  \draw[fill=maingray,maingray] (0,-\i) rectangle (6,-\i+0.4);
  \draw[fill=white,cerulean](0,-\i) rectangle (1.2*\y,-\i+0.4);
  \node [above right ] at (0,-\i+0.4) {\x};
  \foreach \z in {0,1,2,...,10}
  {
    \coordinate (A\z) at ($(0,-\i)+(1.2*\z*0.5cm,0)$) {};
    \ifodd\z
        \draw[white] ($(A\z)$) -- ($(A\z)+(0,2.5pt)$);
    \else
        \draw[white] ($(A\z)$) -- ($(A\z)+(0,5pt)$);
    \fi
  }
}
\end{tikzpicture}
}
}
\newcommand{\givenskill}{}

\newcommand\skillstext[1]{ 

\renewcommand{\giventextskill}{
\begin{flushleft}
\noindent
\foreach [count=\i] \x/\y in {#1}
{ 
\x$ \star $\y
}
\end{flushleft}
}
}


\newcommand{\giventextskill}{}


  
\newcommand{\makeprofile}
{
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=asidecolor, anchor=north, minimum width=9.4cm, minimum height=\paperheight+2cm] (box) at (-5.0cm,+0.60cm){};
\end{tikzpicture}


\begin{textblock}{6}(0.5, 0.2)
\begin{flushleft}
\hspace{13pt}
%\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
 %   \clip (600/2, 567/2) circle (567/2);

%        \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\givenprofilepic}};
%\end{tikzpicture}
\vspace{-0.31cm}
{\Huge\color{cerulean}\givencvname}
\begin{flushright}
{\Large\color{black!80}\givencvjobtitle}
\end{flushright}

\vspace{0.5cm}



\profilesection{Personal Info}{2.08cm}
\givenemptyspace
 
\vspace{-0.5cm}
\hspace{-0.65cm}
\renewcommand{\arraystretch}{1.6}
\begin{tabular}{p{0.5cm} @{\hskip 0.8cm}p{5cm}}
\ifthenelse{\equal{\givencvdate}{}}{}{\textsc{\Large\icon{\faCalendar}} & \givencvdate\\}

\ifthenelse{\equal{\givencvaddress}{}}{}{\textsc{\Large\icon{\Letter}} & \givencvaddress\\}

\ifthenelse{\equal{\givennumberphone}{}}{}{\textsc{\Large\icon{\faPhoneSquare}} & \givennumberphone\\}
\ifthenelse{\equal{\givencvsite}{}}{}{\textsc{\Large\icon{\faGlobe}} & \href{\givencvsite}{\textcolor{cerulean}\givencvsite}}\\
\ifthenelse{\equal{\givencvmail}{}}{}{\textsc{\large\icon{\faEnvelope}} & \href{mailto:\givencvmail}{\givencvmail}}
\end{tabular}




\profilesection{About me}{3.25cm}
\givenaboutme


\profilesection{Languages}{2.79cm}
\givenskill
%\giventextskill
\noindent
\scriptsize
\noindent
(*)[Skill scale: 0 (Awareness) to 10 (Expert).]


%\profilesection{Personal Skills}{1.0cm}
%\vspace{-10pt}
%\begin{description}[leftmargin=*]
%	\small
%	\item[Agile]
%	\item[Scrum Methodology]
%	\item[Attention to details]
%\end{description} 


\end{flushleft}
\end{textblock}
\vspace{-10pt}
 }




%%%%%%%%%%%%%%%%
% Section Color box %
%%%%%%%%%%%%%%%%
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
   \round{#1#2#3}{
      \ifcase\value{colorCounter}%
        maingray\or%
        cerulean\or%
        maingray\or%
        cerulean\else%
        maingray\fi%
    }%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par%\vspace{\parskip}
  {%
    \LARGE\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{0.5pt}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List twenty environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{twenty}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\newcommand{\twentyitem}[4]{%
  \hspace{5pt}#1&\parbox[t]{11.5cm}{%
    #2%
    \hfill%
    {\footnotesize#3}\\%
    #4\vspace{\parsep}
  }\\}


\newcommand{\fivetwentyitem}[5]{%
	\hspace{5pt}#1&\parbox[t]{11.5cm}{%
		#2%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}\\%
		#5\vspace{\parsep}%
	}\\}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Small twenty List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyshort}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
%\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshort}[2]{%
  \hspace{5pt}#1&\parbox[t]{9.2cm}{%
    {#2}%
  }\\}


%%%%%%%%%%%%
% Page Setting %
%%%%%%%%%%%%

\RequirePackage[left=7.3cm,top=0.2cm,right=0.5cm,bottom=0.2cm,nofoot]{geometry}
\RequirePackage{hyperref}
