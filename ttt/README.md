
# TikZ TeX TalK

![a spinning color wheel that seems to be drawing cycloid](cycloid/cycloid.gif)

```latex
% cycloid.tex
\documentclass[tikz]{standalone}
\begin{document}
\def\wheel#1;{
    \begin{scope}#1
        \clip\pgfextra{\pgfseteorule}circle(5)circle(3);
        \fill[yellow!90!black](-9,-9)rectangle(9,9);
        \fill[rotate=\f*14,blue](-9,-9)rectangle(0,0)rectangle(9,9);
    \end{scope}
}
\foreach\f in{1,...,90}{ % frame
    \tikz{
        \fill[gray](-6,-6)rectangle(6,6);
        
        \pgfmathsetmacro\dx{0.05*cos(-\f*4)}
        \pgfmathsetmacro\dy{0.05*sin(-\f*4)}
        \wheel[shift={(\dx,\dy)},rotate=-14]; % help wheel
        \wheel[shift={(-\dx,-\dy)},rotate=14]; % help wheel
        \wheel[]; % main wheel
        
        \draw[->,scale=3](\dy,-\dx)--(-\dy,\dx);
    }
}
\end{document}
```

Convert pdf to gif with terminal command

```shell
convert -delay 2 cycloid.pdf cycloid.gif
```

or with this command that does anti-aliasing

```shell
convert -delay 2 -density 300 -resize 300x300 cycloid.pdf cycloid.gif
```

This is inspired by <https://twitter.com/jagarikin/status/1331409504953540613>.
