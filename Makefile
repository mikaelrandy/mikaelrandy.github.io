JEKYLL_CMD=bundle exec jekyll

install:
	bundle install

build:
	$(JEKYLL_CMD) build

serve:
	$(JEKYLL_CMD) serve --watch

deploy: build
	rsync -a --checksum -P _site/ mikaelrandy:www/mikaelrandy.fr/
