index.html:README.md
	grip README.md --title=index --export index.html
	sed -i '' '/link\ rel\=\"icon\"/d' ./index.html
	sed -i '' '/stylesheet/d' ./index.html
