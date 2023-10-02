# Re-build only pages that are new/changed since last run.
default:
	jupyter-book build -W source

# Re-build all pages.
all:
	jupyter-book build -W --all source

# Publish to production site.
pub: all
	ghp-import --no-jekyll --push --no-history ./source/_build/html
	ghp-import --no-jekyll --push --remote itap --no-history ./source/_build/html