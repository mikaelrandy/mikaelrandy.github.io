.PHONY: install build serve deploy

install:
	bundle install

build:
	rm -rf _site/*
	bundle exec jekyll build

serve:
	bundle exec jekyll serve --watch

deploy: build
	scp -r _site/* mikaelrandy:www/mikaelrandy.fr/
