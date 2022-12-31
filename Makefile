.PHONE: doc
doc:
	sed -i -n '1,/^## Documentation/ p' README.md
	echo '```zsh' >> README.md
	./svec help >> README.md
	echo '```' >> README.md
