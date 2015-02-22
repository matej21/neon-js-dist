PATH        := ./node_modules/.bin:${PATH}
NPM_VERSION := $(shell node -e 'process.stdout.write(require("./node_modules/neon-js/package.json").version)')

browserify:
	rm ./dist/*
	# Browserify
	( echo -n "/* neon-js ${NPM_VERSION} */" ; \
		browserify -r neon-js -s neon \
		) > dist/neon.js
	# Minify
	uglifyjs dist/neon.js -c -m \
		--preamble "/* neon-js ${NPM_VERSION} */" \
		> dist/neon.min.js
