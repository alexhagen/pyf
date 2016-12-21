all: docs

docs: FORCE
	mkdir -p ~/pages/pyf/docs; \
	cd ~/pages/pyf/docs/; \
	git rm -r *; \
	mkdir -p ~/pages/pyf/docs; \
	cd ~/code/pyf/docs/; \
	make html; \
	cp -r _build/html/* ~/pages/pyf/docs/; \
	cd ~/pages/pyf/docs; \
	git add *; \
	git commit -am "$(shell git log -1 --pretty=%B | tr -d '\n')"; \
	git push origin gh-pages; \
	cd ~/code/pyf

FORCE: