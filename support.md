
# Resources Regarding the Website Itself

Disclaimer:
I am a math person.
I have very little to none background with IT things.
What I wrote here is how I worked out staffs.
I hope it helps people like me.

## GitHub Pages

This site is built using GitHub Pages.
GitHub Pages turns Markdown files
in a repository called `yourID.github.io` into static html files.
Every time you edit a Markdown file named `yourFile.md`,
GitHub uses its server power to process the file and
stores the resulting HTML file at `https://yourID.github.io/yourFile`.

For instance, my ID is `Symbol1`,
so the repository is called `Symbol1.github.io`
([link to the repo](https://github.com/Symbol1/Symbol1.github.io)).
This webpage comes from a file named `support.md` ([link to the md]).
Github processes this file and put the generated html file at
`https://symbol1.github.io/support`.

To begin using GitHub Pages,
visit the [official landing page](https://pages.github.com/).

Roughly speaking, the process that turns md files into html files is a map

    phi.html = md2html (phi.md, theme)

Here, `phi.md` contains the actual content (be it a theorem or your CV).
The `theme` is a collection of files that determines
how your contents look (font, size, color, etc);
they are stored in some certain repositories.
The `md2html` is a collection of scripts
that are stored and executed on GitHub servers.

Upon creating a website via GitHub Pages,
you will be asked to choose a `theme` from a predefined list;
choose one then.
I choose `minimal` (not `minima`).
After that, beginners are encouraged to create and edit md files
without touching the `theme` and the `md2html` part.

Beginners at the next level may try to alter the `theme` part.
This is where things get complicated.
You see, beginners like me use one of the predefined `theme`s.
We have no control over those `theme` files
while some online tutorials and forum answers assume that we do.

So let me make this clear:
Unless you want to level up further,
you should stay with simple parameters like dimensions, colors, and fonts.
They are easily customizable via a CSS file.
Unfortunately, even customizing CSS is `theme`-dependent.
For `minimal` users,
[its readme](https://github.com/pages-themes/minimal#stylesheet) helps.
For the other `theme`s,
you need to google out the corresponding `theme`'s documentation.
[This general doc][add CSS] may also help.

## Have a private copy of `theme`

There is one way that technically lets you
customize almost everything in a theme.
In a `theme`'s repository, for instance in
[this folder](https://github.com/pages-themes/minimal/tree/master/_layouts),
you can see the file named `default.html`.
This is the root template that will be filled in with contents later.
By altering this file you have the root control over how your website looks.
But you cannot alter this file;
this file belongs to GitHub's official account.

Fortunately, you can copy and paste this file into your repository.
When the map `md2html` is executed, it looks for `theme` files
in *your* repository before going to the official one.
In greater detail, you

1. copy and paste the `default.html` file to
    `yourID.github.io/_layouts/default.html`,
1. make whatever changes to it,
1. commit and push, and
1. wait for a few minutes.

You will then see the change in your website.

You can see what I did in my case---compare
[my own `theme` file] with the [official `theme` file].
In my case, I deleted some text and add a script that brings MathJax in.
I will explain MathJax in the next subsection.

## MathJax support

The motivation is that I want to write $\LaTeX$ staff in my website.
One way to enable beautiful math is to include a MathJax script
that turns strings like `$ma^2+mb^2=F+V-2$` into $ma^2+mb^2=F+V-2$.
To do that, you need to be able to insert a `<script>` tag into the HTML file.
There are many ways to achieve this.
But the easiest way is to insert the `<script>` tag into the `theme` file.
(That is why I need to have a private copy of the `theme`).
[These lines in my copy][mathjax script] are the inserted `<script>`.

For more configurations, see this
[MathJax doc](http://docs.mathjax.org/en/latest/web/start.html).
Remark:
The link above points to the latest documentation (for `3.x.x`).
On the other hand, some online tutorials and forum answers
are written based on versions `2.x.x`.

## Host everything yourself

Chances are that you can host the content, the `theme`,
and even the `md2html` map.
Doing so, you gain controls over everything and do whatever you want.
For instance, [email obfuscation].
However, that requires you to have something that can execute `md2html`.
You either have to build your own server or use one of the IaaS.
They not only are more complicated but also cost some positive money.
(Everything I mentioned so far is free, as of 2020 May.)

[link to the md]: https://github.com/Symbol1/Symbol1.github.io/blob/master/support.md
[add CSS]: https://help.github.com/en/github/working-with-github-pages/adding-a-theme-to-your-github-pages-site-using-jekyll#customizing-your-themes-css
[my own `theme` file]: https://github.com/Symbol1/Symbol1.github.io/tree/master/_layouts
[official `theme` file]: https://github.com/pages-themes/minimal/blob/master/_layouts/default.html
[mathjax script]: https://github.com/Symbol1/Symbol1.github.io/blob/master/_layouts/default.html#L33-L42
[email obfuscation]: https://support.cloudflare.com/hc/en-us/articles/200170016-What-is-Email-Address-Obfuscation-
