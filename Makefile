all: docs

docs: FORCE
	pandoc README.md -o docs/README.rst; \
	cd ~/pages/pyf/; \
	git rm -r *; \
	cd ~/code/pyf/docs/; \
	make html; \
	cp -r _build/html/* ~/pages/pyf/; \
	cd ~/pages/pyf; \
	touch .nojekyll; \
	git add *; \
	git add .nojekyll; \
	git commit -am "$(shell git log -1 --pretty=%B | tr -d '\n')"; \
	git push origin gh-pages; \
	cd ~/code/pyf

FORCE:
