.PHONY: install build serve

install:
	bundle install

build:
	bundle exec jekyll build

serve:
	bundle exec jekyll serve --watch
