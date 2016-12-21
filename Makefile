all: docs

docs: FORCE
	cd ~/pages/pyf/; \
	git rm -r *; \
	cd ~/code/pyf/docs/; \
	make html; \
	cp -r _build/html/* ~/pages/pyf/; \
	cd ~/pages/pyf; \
	touch .nojekyll; \
	git add *; \
	git commit -am "$(shell git log -1 --pretty=%B | tr -d '\n')"; \
	git push origin gh-pages; \
	cd ~/code/pyf

FORCE:
