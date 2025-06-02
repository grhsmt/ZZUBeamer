\ProvidesClass{zzu-slide}[zzu Undergraduates Thesis Slide Template]
\PassOptionsToPackage{AutoFakeBold}{xeCJK}
\PassOptionsToClass{\CurrentOption}{beamer}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

%%%%%%%% 宏包 %%%%%%%%

% 中文字体
\RequirePackage{xeCJK}
\RequirePackage{ctex}
% 图形背景
\RequirePackage{tikz}
% 插图
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
% 表格线
\RequirePackage{booktabs}
% 数学公式
\RequirePackage{array}
\RequirePackage{mathptmx}
\RequirePackage{bm}
% 绘图
% \RequirePackage{pgfplots}
% 条件编译
\RequirePackage{ifthen}
% 网页链接
\RequirePackage{hyperref}
% 加载 chngcntr 宏包用于调整计数器的行为
\RequirePackage{chngcntr}
\RequirePackage{etoolbox}
% 加载算法相关的宏包
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{diagbox}
\RequirePackage{amsmath}
\RequirePackage{url}
\RequirePackage{pythonhighlight}

\RequirePackage[backend=bibtex, style=numeric, sorting=none]{biblatex}

\mode<presentation>

% 自定义图片计数器
\newcounter{figurecounter}
\renewcommand{\thefigurecounter}{\arabic{figurecounter}}

% 自定义表格计数器
\newcounter{tablecounter}
\renewcommand{\thetablecounter}{\arabic{tablecounter}}

% 将图片计数器与章节计数器关联
\counterwithin{figure}{section}

% 将表格计数器与章节计数器关联
\counterwithin{table}{section}

% 配置图片标题格式
\DeclareCaptionLabelFormat{figurelabel}{图~\thesection.\thefigurecounter}
\captionsetup[figure]{labelformat=figurelabel}

% 配置表格标题格式
\DeclareCaptionLabelFormat{tablelabel}{表~\thesection.\thetablecounter}
\captionsetup[table]{labelformat=tablelabel}

% 确保计数器在文档开始时从 1 开始
\AtBeginDocument{
    \setcounter{figurecounter}{0}
    \setcounter{tablecounter}{1}
}

% 在 figure 环境中手动递增计数器
\pretocmd{\figure}{\refstepcounter{figurecounter}}{}{}

% 在每一帧开始时，确保计数器不重置
\pretocmd{\frame}{\addtocounter{figurecounter}{0}}{}{}

%%%%%%%% 用户自定义变量 %%%%%%%%

\newcommand{\dark}{\def\zzu@dark{true}}        % 启用深色主题
\newcommand{\nav}{\def\zzu@nav{true}}          % 启用底部导航按钮
\renewcommand{\title}[1]{\def\zzu@title{#1}}   % 标题
\renewcommand{\subtitle}[1]{\def\zzu@subtitle{#1}}
\renewcommand{\author}[1]{\def\zzu@author{#1}} % 作者
\newcommand{\teacher}[1]{\def\zzu@teacher{#1}} % 指导教师
\newcommand{\pubdate}[1]{\def\zzu@pubdate{#1}} % 日期

%%%%%%%% 颜色定义 %%%%%%%%

\definecolor{zzured}{RGB}{167,25,48}
% \definecolor{zzublue}{RGB}{40,100,190}        % 郑大主题蓝色
\definecolor{zzugreen}{RGB}{0,105,60}         %郑大主题绿色
\definecolor{zzumiddleblue}{RGB}{115,170,250} % 郑大主题中蓝色
\definecolor{zzulightblue}{RGB}{200,222,255}  % 郑大主题浅蓝色

\setbeamercolor{palette primary}{bg=zzugreen,fg=white}
\setbeamercolor{palette secondary}{bg=zzulightblue,fg=zzugreen}
\setbeamercolor{palette tertiary}{bg=zzugreen,fg=white}
\setbeamercolor{palette quaternary}{bg=white,fg=zzugreen}
\setbeamercolor{structure}{bg=white,fg=zzugreen}
\setbeamercolor{block title}{bg=zzugreen,fg=white}
\setbeamercolor{block body}{bg=zzulightblue,fg=zzugreen}

%%%%%%%% 字体定义 %%%%%%%%

% 英文默认字体
\setmainfont{Times New Roman}
\setsansfont{Arial}
% 中文默认字体
\setCJKmainfont{zzufont/simsun.ttc} [BoldFont=zzufont/simhei.ttf]

%%%%%%%% 幻灯片样式 %%%%%%%%

% 主题
\usetheme{default}
\useoutertheme{infolines}
\useinnertheme{circles}
\usefonttheme[onlymath]{serif}

\setbeamersize{text margin left=5ex,text margin right=5ex} % 页边距
\renewcommand{\baselinestretch}{1.3}                       % 行距
\setlength{\parskip}{1ex}                                  % 段落间距

%%%%%%%% 封面 %%%%%%%%

\renewcommand{\maketitle}{
    % 底部导航按钮
    \ifthenelse{\isundefined{\zzu@nav}}{\setbeamertemplate{navigation symbols}{}}{}

    \ifthenelse{\isundefined{\zzu@dark}}{
        % 浅色主题封面
        \begin{frame}[plain]
            \begin{center}
                \vskip 12pt
                \includegraphics[height=55pt]{zzulogo/zzu-logo2.png}
                \vskip -8pt
                    {\zihao{-5}\bf\songti 本\, 科\, 毕\, 业\, 答\, 辩}
                \vskip 10pt
                \begin{beamercolorbox}[wd=\paperwidth,center]{palette primary}
                    \vskip 2pt
                    \zihao{2}\zzu@title
                    \vskip 0.5pt
                    \zihao{5}\zzu@subtitle
                    \vskip 4pt
                \end{beamercolorbox}
                \vskip 10pt
                \begin{tabular}{r@{\hskip 1.5ex}l}
                    答辩人：  & \zzu@author  \\
                    指导教师： & \zzu@teacher \\
                \end{tabular}
                \vskip 12pt
                \color{gray}\zihao{-5}\zzu@pubdate
            \end{center}
        \end{frame}
    }{
        % 深色主题封面
        \setbeamercolor{background canvas}{bg=zzugreen}
        \begin{frame}[plain]
            \begin{center}
                \vskip 12pt
                \includegraphics[height=45pt]{zzulogo/zzu-logo4.png}
                \vskip -8pt
                    {\color{white}\zihao{-5}\bf\songti 本\, 科\, 毕\, 业\, 答\, 辩}
                \vskip 10pt
                \begin{beamercolorbox}[wd=\paperwidth,center]{palette secondary}
                    \vskip 2pt
                    \zihao{2}\zzu@title
                    \vskip 0.5pt
                    \zihao{5}\zzu@subtitle
                    \vskip 4pt
                \end{beamercolorbox}
                \vskip 10pt
                \color{white}
                \begin{tabular}{r@{\hskip 1.5ex}l}
                    答辩人：  & \zzu@author  \\
                    指导教师： & \zzu@teacher \\
                \end{tabular}
                \vskip 12pt
                \zihao{6}\zzu@pubdate
            \end{center}
        \end{frame}
        \setbeamercolor{background canvas}{bg=white}
    }
}

%%%%%%%% 转场页 %%%%%%%%

\newcommand{\zzusection}[2]{
    \section{#1}
    \ifthenelse{\isundefined{\zzu@dark}}{
        % 浅色转场页
        \begin{frame}[plain]
            \vskip 64pt
            \color{gray}\zihao{-3}第\zhnumber{\thesection}部分\zihao{5}
            \vskip 20pt
            \begin{beamercolorbox}[wd=\paperwidth]{palette secondary}
                \vskip 0pt
                \hskip 28pt\color{zzugreen}\zihao{-0}#1
                \vskip 0.3ex
                \hskip 28pt\color{zzugreen}\zihao{4}#2
                \vskip 20pt
            \end{beamercolorbox}
            \tikz[overlay,remember picture]
            \node[opacity=0.1, at=(current page.center)]
            {\hskip 448pt\includegraphics[height=\paperheight]{zzulogo/zzu-logo1.png}};
        \end{frame}
    }{
        % 深色转场页
        \setbeamercolor{background canvas}{bg=zzugreen}
        \begin{frame}[plain]
            \vskip 15pt
            \color{white}\zihao{-3}第\zhnumber{\thesection}部分\zihao{5}
            \vskip 15pt
            \begin{beamercolorbox}[wd=\paperwidth]{palette secondary}
                \vskip 0pt
                \hskip 15pt\color{zzugreen}\zihao{-0}#1
                \vskip 0.3ex
                \hskip 30pt\color{zzugreen}\zihao{4}#2
                \vskip 20pt
            \end{beamercolorbox}
            \tikz[overlay,remember picture]
            \node[opacity=0.1, at=(current page.center)]
            {\hskip 350pt\includegraphics[height=\paperheight]{zzulogo/zzu-logo1.png}};
        \end{frame}
        \setbeamercolor{background canvas}{bg=white}
    }
}
%%%%%%%% 结束页 %%%%%%%%

\newcommand{\thanksforlistening}[1]{
    \ifthenelse{\isundefined{\zzu@dark}}{
        % 浅色结束页
        \begin{frame}[plain]
            \begin{center}
                \vskip 24pt
                \color{gray}\zihao{2}THE END
                \vskip 24pt
                \begin{beamercolorbox}[wd=\paperwidth,center]{palette primary}
                    \vskip 4pt
                    \zihao{1}#1
                    \vskip 24pt
                \end{beamercolorbox}
                \vskip 8pt
                \includegraphics[height=24pt]{zzulogo/zzu-logo1.png}
            \end{center}
        \end{frame}
    }{
        % 深色结束页
        \setbeamercolor{background canvas}{bg=zzugreen}
        \begin{frame}[plain]
            \begin{center}
                \vskip 16pt
                \color{white}\zihao{2}THE END
                \vskip 24pt
                \begin{beamercolorbox}[wd=\paperwidth,center]{palette secondary}
                    \vskip 4pt
                    \zihao{1}#1
                    \vskip 24pt
                \end{beamercolorbox}
                \vskip 8pt
                \includegraphics[height=24pt]{zzulogo/zzu-logo4.png}
            \end{center}
        \end{frame}
        \setbeamercolor{background canvas}{bg=white}
    }
}

%%%%%%%% 幻灯片页眉、页脚 %%%%%%%%

% 页眉
\setbeamertemplate{headline}{
    \leavevmode%
    \hbox{%
         \begin{beamercolorbox}[wd=\paperwidth,ht=18pt,dp=1.125ex,center]{section in head/foot}
            \usebeamerfont{section in head/foot}
            \insertnavigation{\paperwidth}{\hskip0.1pt plus1filll}{}
        \end{beamercolorbox}
    }%
}
\setbeamertemplate{frametitle continuation}{}

% 帧标题
\setbeamertemplate{frametitle}{
    \nointerlineskip
    \begin{beamercolorbox}[sep=0.3cm,ht=5ex,wd=\paperwidth]{palette quaternary}
        \strut\hspace{2ex}\zihao{3}\insertframetitle\hspace{\fill}\raisebox{-0.9ex}{\includegraphics[height=2em]{zzulogo/zzu-logo2.png}}\hspace{2ex}\strut
        \vskip -0.45ex
    \end{beamercolorbox}
}

% 页脚
\setbeamertemplate{footline}{
    \leavevmode
    \hbox{
        \begin{beamercolorbox}[wd=0.2\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}
            \usebeamerfont{author in head/foot}
            \zzu@author
        \end{beamercolorbox}
        \begin{beamercolorbox}[wd=0.6\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}
            \usebeamerfont{title in head/foot}
            \zzu@title
        \end{beamercolorbox}
        \begin{beamercolorbox}[wd=0.2\paperwidth,ht=2.25ex,dp=1ex,center]{section in head/foot}
            \usebeamerfont{page number in head/foot}
            \insertframenumber{} / \inserttotalframenumber\hspace*{1ex}
        \end{beamercolorbox}
    }
}

%%%%%%%% 图表 %%%%%%%%

\graphicspath{{figures/}}

% 配置算法环境
\renewcommand{\algorithmname}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}

% 自定义跨页算法环境
\makeatletter
\newenvironment{zzubreakablealgorithm}
{
    \begin{center}
        \refstepcounter{algorithm}% 新算法
        \hrule height.8pt depth0pt \kern2pt% 顶部边框和间距
        \renewcommand{\caption}[2][\relax]{% 重定义 \caption
            {\raggedright\textbf{算法~\thealgorithm} ##2\par}% 使用中文“算法”
            \ifx\relax##1\relax % 如果 #1 是 \relax
                \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##2}%
            \else % 如果 #1 不是 \relax
                \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##1}%
            \fi
            \kern2pt\hrule\kern2pt
        }
    }{
    \kern2pt\hrule\relax % 底部边框和间距
    \end{center}
}
\makeatother

\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{fontspec}
% 定义代码环境
\lstnewenvironment{zzucode}[1][]{%
    \lstset{
        numbers=left, 
        numberstyle= \tiny, 
        keywordstyle= \color{ blue!70},%设置关键字颜色
        commentstyle= \color{red!50!green!50!blue!50}, %设置注释颜色
        frame=shadowbox, % 阴影效果
        rulesepcolor= \color{ red!20!green!20!blue!20},
        escapeinside='', % 英文分号中可写入中文
        xleftmargin=2em, %距离左边界2em
        aboveskip=1em,
        framexleftmargin=2em,
        basicstyle=\ttfamily,
        columns=fullflexible,%可以自动换行
        linewidth=1\linewidth, %设置代码块与行同宽
        breaklines=true,%在单词边界处换行。
        showstringspaces=false, %去掉空格时产生的下划的空格标志, 设置为true则出现
        breakatwhitespace=ture,%可以在空格处换行
        escapechar=',%设置转义字符为反引号
        #1 % 允许用户传入额外的配置参数
    }%
}{}

\mode<all>
\endinput
