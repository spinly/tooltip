
default: components node_modules index.js build/build.css template.html test.html

build/build.css: index.js index.styl test.html
	@component build --dev --use stylus

template.html: template.jade
	@./node_modules/.bin/jade $< && \
		component convert $@

test.html: test.jade
	@./node_modules/.bin/jade $<

node_modules: package.json
	@npm install

components: component.json
	@component install --dev

clean:
	rm -fr build components

.PHONY: clean build default
