dev-start:
	python3 manage.py runserver --settings=config.settings.dev
dev-migrate:
	python3 manage.py migrate --settings=config.settings.dev
dev-makemigrations:
	python3 manage.py makemigrations --settings=config.settings.dev
dev-shell:
	python3 manage.py shell --settings=config.settings.dev
dev-shell-plus:
	python3 manage.py shell_plus --settings=config.settings.dev
dev-install:
	pip install -r requirements/dev.txt