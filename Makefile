.DELETE_ON_ERROR:
.SECONDARY:

all: 10xgenomics-slides.html

clean:
	rm -f 10xgenomics-slides.html

# Deploy the slides to GitHub Pages.
deploy: 10xgenomics-slides.html
	git checkout -B gh-pages
	cp $< index.html
	git add index.html
	git commit -m 'Add index.html'
	git push --force
	git checkout master

# Install dependencies.
install-deps:
	brew install pandoc

# Create the HTML slides.
%.html: %.md reveal.js/js/reveal.js
	pandoc -st revealjs -V theme:sky -o $@ $<

# Create the self-contained HTML slides.
%-self-contained.html: %.md reveal.js/js/reveal.js
	pandoc -st revealjs -V theme:sky --self-contained -o $@ $<

# Download reveal.js
revealjs-3.8.0.tar.gz:
	curl -L -o $@ https://github.com/hakimel/reveal.js/archive/3.8.0.tar.gz

# Extract reveal.js
reveal.js-3.8.0/js/reveal.js: revealjs-3.8.0.tar.gz
	tar xf $<
	touch $@

# Patch reveal.js
reveal.js/js/reveal.js: reveal.js-3.8.0/js/reveal.js
	cp -a reveal.js-3.8.0 reveal.js
	sed -i .orig \
		-e 's/text-transform: uppercase;//' \
		-e 's/font-size: 40px;/font-size: 34px;/' \
		-e 's/border: 4px solid #333;/border: 0px solid #333;/' \
		-e 's/box-shadow: 0 0 10px/box-shadow: 0 0 0px/' \
		reveal.js/css/theme/sky.css
	touch $@
