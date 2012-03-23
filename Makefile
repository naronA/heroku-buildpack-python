docs:
	mkdir -p site
	shocco -t 'Python Buildpack Compiler' ./bin/compile > site/index.html
	shocco -t 'Django Buildpack Compiler' ./bin/steps/django > site/django.html
	shocco -t 'Pylibmc Buildpack Compiler' ./bin/steps/pylibmc > site/pylibmc.html

site: docs
	cd site && git add -A && git commit -m 'update' && git push heroku master

pip:
	git clone git@github.com:kennethreitz/pip.git --branch heroku --depth 1
	rm -fr vendor/virtualenv-1.7/virtualenv_support/pip-1.0.2.tar.gz
	rm -fr pip/.git
	tar -pczf vendor/virtualenv-1.7/virtualenv_support/pip-1.0.2.tar.gz pip
	rm -fr pip

