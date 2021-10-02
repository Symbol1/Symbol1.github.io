
# TikZ TeX TalK

## Cycloid

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

Convert pdf to gif with terminal command (with ImageMagick installed)

```shell
convert -delay 2 cycloid.pdf cycloid.gif
```

or with this command that does anti-aliasing

```shell
convert -delay 2 -density 300 -resize 300x300 cycloid.pdf cycloid.gif
```

This is inspired by <https://twitter.com/jagarikin/status/1331409504953540613>.

## Diffuse

![A former pangram with certain word glowing](diffuse/diffuse.jpg)

```latex
% diffuse.tex
\documentclass[tikz]{standalone}
\begin{document}
\def\textdiffuse#1{\relax%
    \def\diffcoeff{50}%
    \pdfliteral{q 1 J 1 j 1 Tr}%
    \foreach\mixture in{5,10,...,45}{\relax%
        \color{darkgray!\mixture!white}%
        \pgfsetlinewidth{(105-2*\mixture)/\diffcoeff}%
        \rlap{#1}%
    }%
    \pdfliteral{q 4 Tr}%
    \color{darkgray}%
    \rlap{#1}%
    \pdfliteral{1 Tr}%
    \foreach\mixture in{95,90,...,55}{\relax%
        \color{darkgray!\mixture!white}%
        \pgfsetlinewidth{(2*\mixture-95)/\diffcoeff}%
        \rlap{#1}%
    }%
    \pdfliteral{Q}%
    \pgfsetlinewidth{5/\diffcoeff}%
    \color{darkgray!50!white}%
    \rlap{#1}%
    \pdfliteral{Q}%
    \phantom{#1}%
}
\Huge\bfseries
\tikz\node[align=center,scale=10,fill=white]{
    Quick \textdiffuse{Blurred Fox}    \\
    Jumps over    \\
    \colorlet{darkgray}{red}
    the \textdiffuse{Laser Dog}
};
\end{document}
```

Convert pdf to jpg (or png in exchange for file size)
with terminal command (with ImageMagick installed)

```shell
convert -density 144 -resize 2000 diffuse.pdf diffuse.jpg
```

## Inversion

![Applying inversion transformation to Lenna the image](inversion/inversion.jpg)

```latex
\documentclass[border=9,tikz]{standalone}
\begin{document}
\def\LennaIpsum{\includegraphics[width=2cm]{lenna.png}\llap\LaTeX}
\def\RememberInversion(#1,#2){
    \expandafter\xdef\csname Inv(\u,\v)x\endcsname{\xx}
    \expandafter\xdef\csname Inv(\u,\v)y\endcsname{\yy}
}
\def\RecallInversion#1(#2,#3){
    \expandafter\xdef\csname#1x\endcsname{\csname Inv(#2,#3)x\endcsname}
    \expandafter\xdef\csname#1y\endcsname{\csname Inv(#2,#3)y\endcsname}
}
\tikz{
    \draw circle(.05)circle(5)(3,0)node{\LennaIpsum}(12.5,0);
    \draw[dotted](4,-5)--(4,5)(3.125,0)circle(3.125);
    \foreach\u in{-10,...,10}{
        \foreach\v in{-10,...,10}{
            % Affine transformation of (u, v), unit mm
            \pgfmathsetmacro\uu{\u+30}
            \pgfmathsetmacro\vv{\v+0}
            \pgfmathsetmacro\rr{\uu*\uu+\vv*\vv}
            % Take inversion, unit mm
            \pgfmathsetmacro\xx{50*\uu/\rr*50}
            \pgfmathsetmacro\yy{50*\vv/\rr*50}
            % Remember the coordinates
            \RememberInversion(\u,\v)
        }
    }
    \foreach\u in{-10,...,9}{
        \foreach\v in{-10,...,9}{
            % For every square, recall the coordinates of the four corners
            \pgfmathtruncatemacro\U{\u+1}
            \pgfmathtruncatemacro\V{\v+1}
            \RecallInversion NW(\u,\V)\RecallInversion NE(\U,\V)
            \RecallInversion SW(\u,\v)\RecallInversion SE(\U,\v)
            % The lower left triangle ◺
            \pgfmathsetmacro\aa{\SEx-\SWx}\pgfmathsetmacro\ab{\SEy-\SWy}
            \pgfmathsetmacro\ba{\NWx-\SWx}\pgfmathsetmacro\bb{\NWy-\SWy}
            \pgflowlevelobj{
                \pgfsettransformentries\aa\ab\ba\bb{\SWx mm}{\SWy mm}
            }{
                \clip(1.02mm,0)-|(0,1.02mm)--cycle;
                \path(-\u mm,-\v mm)node{\LennaIpsum};
            }
            % The upper right triangle ◹
            \pgfmathsetmacro\aa{\NEx-\NWx}\pgfmathsetmacro\ab{\NEy-\NWy}
            \pgfmathsetmacro\ba{\NEx-\SEx}\pgfmathsetmacro\bb{\NEy-\SEy}
            \pgflowlevelobj{
                \pgfsettransformentries\aa\ab\ba\bb{\NEx mm}{\NEy mm}
            }{
                \clip(-1mm,.01mm)-|(.01mm,-1mm)--cycle;
                \path(-\U mm,-\V mm)node{\LennaIpsum};
            }
        }
    }
}
\end{document}
```

Convert pdf to jpg with terminal command (with ImageMagick installed)

```shell
convert -density 300 inversion.pdf inversion.jpg
```

## Galaxy

![Pixelated galaxy is rotating](galaxy/galaxy.gif)

```latex
\documentclass[tikz]{standalone}
\begin{document}
\foreach~in{0,5,...,179.9}{
    \pgfdeclarefunctionalshading{Balls}
    {\pgfpoint{-25bp}{-25bp}}{\pgfpoint{25bp}{25bp}}{}{
        % X Y
        1 index floor .5 add % X Y U:=floor(X)+.5
        1 index floor .5 add % X Y U V:=floor(T)+.5
        2 copy % X Y U V U V
        2 copy % X Y U V U V U V
        25 div % X Y U V U V U v:=V/25
        dup mul % X Y U V U V U v²
        exch % X Y U V U V v² U
        25 div % X Y U V U V v² u:=U/25
        dup mul % X Y U V U V v² u²
        add sqrt % X Y U V U V r:=√u²+v²
        360 mul % X Y U V U V R:=360r
        3 1 roll % X Y U V R U V
        atan % X Y U V R θ
        ~ add % add the phase
        add % X Y U V τ:=R+θ+phase
        sin % X Y U V sin(τ)
        dup mul % X Y U V s:=sin(τ)²
        5 1 roll % s X Y U V
        3 2 roll % s X U V Y
        sub 2 mul % s X U y:=2(V-Y)
        dup mul % s X U y²
        3 1 roll % s y² X U
        sub 2 mul % s y² x:=2(X-U)
        dup mul % s y² x²
        add % s q:=y²+x²
        le {0 0 0} {1 1 1} ifelse % s ≤ q ? black : white
    }
    \tikz\path[shading={Balls}](-10,-10)rectangle(10,10);
}
\end{document}
```
