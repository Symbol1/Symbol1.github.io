


# Resources Regarding the Website Itself

Disclaimer:
I am a math person.
I have very little to none background with IT things and
what I wrote here is how I worked out staffs, from my perspective.
I hope it helps people like me.


## GitHub Pages

This site is built by GitHub Pages which turns Markdown files
in a repository called `yourID.github.io` into static html files.
Every time you edit a Markdown file called `yourFile.md`
(and push it so GitHub is aware of it),
GitHub uses its server to process the file and
stores the resulting HTML file at `https://yourID.github.io/yourFile`.
For instance, this webpage comes from a file named `support.md`
so it is put at `https://symbol1.github.io/support`.
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
You see, beginners like me use one of the predefined `theme`s
and we have no control over those `theme` files,
while some documentations and forum answers assume that we host everything.

So let me make this clear:
Unless you want to level up further,
you should stay with simple parameters like font, size, and color.
They are easily customizable via a CSS file.
Unfortunately, even customizing CSS is `theme`-dependent.
For `minimal` users,
[its readme](https://github.com/pages-themes/minimal#stylesheet) helps.
For the other `themes`,
you need to google out the corresponding `theme`'s doc.
[This general doc][add CSS] may also help.


## Have a theme layout copy

There is one way that technically
let you customize almost everything in a theme.
In a `theme`'s repository, for instance in
[this folder](https://github.com/pages-themes/minimal/tree/master/_layouts),
you can see the file named `default.html`.
This is the root template that will be filled in various information later.
By altering this file you have the root control over how your website looks.
But you cannot alter this file; this file belongs to the GitHub office.

Fortunately, you can copy and paste this file into your repository.
When the map `md2html` is executed, it will look for `theme` files
in *your* repository before going to the official one.
So the chance is that, you copy this file to
`yourID.github.io/_layouts/default.html`,
make whatever change to it, push, and wait for a few minutes.
You will see the change in your website.

See what I did
[in my case](https://github.com/Symbol1/Symbol1.github.io/tree/master/_layouts).
In my case, I deleted some text and add a script that brings in the MathJax.
I will explain in the next subsection.


## MathJax support

So basically I want to write $\LaTeX$ staff in my website
and one way is to include a MathJax script
that turns strings like `$a^2+b^2=c^2$` into $a^2+b^2=c^2$.
To do that, you need to be able to insert a `<script>` label into the HTML file.
There are probably more than one million ways to do so.
But the easiest way is to insert the `<script>` label into the template.
[These lines][mathjax script] are the `<script>`.

For more configurations, see this
[MathJax doc](http://docs.mathjax.org/en/latest/web/start.html).


## Host everything

Chances are that you can host the content, the `theme`,
and even the `md2html` map.
Doing so, you gain controls over everything and do whatever you want.
For instance, [email obfuscation][email].
However, that requires you to have something that can execute `md2html`.
You either have to build your own server or using one of the IaaS.
They not only are more complicated but also cost some positive money.
(Yes, everything I mentioned above is free, as of 2020/02/02.)


[add CSS]: https://help.github.com/en/github/working-with-github-pages/adding-a-theme-to-your-github-pages-site-using-jekyll#customizing-your-themes-css
[mathjax script]: https://github.com/Symbol1/Symbol1.github.io/blob/master/_layouts/default.html#L13-L22
[email]: https://support.cloudflare.com/hc/en-us/articles/200170016-What-is-Email-Address-Obfuscation-

