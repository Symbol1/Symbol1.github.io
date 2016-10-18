# encoding: utf-8

require 'github/markup'
file=File.open('index.html', 'w')
file.write(GitHub::Markup.render('README.md', File.read('README.md')))
file.close