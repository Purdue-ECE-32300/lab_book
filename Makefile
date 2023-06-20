all:
	# jupyter-book build -W --all source
	jupyter-book build -W source

pub:
	ghp-import --no-jekyll --push --no-history ./source/_build/html