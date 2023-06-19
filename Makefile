all:
	jupyter-book build --all source

pub:
	ghp-import --no-jekyll --push --no-history ./source/_build/html