# django-boilerplate

Are you tired of going through the same process whenever you want to start a new project in Django? To set up a production standard Django project can be overwhelming at times.

Here, I present to you this boilerplate that set up an enterprise standard Django project using latest version of Django

## Note
`make dev-install` will install `Django~=5.0`, which ensures security update for Django version 5.

## Set Up

- Clone the repo `git clone https://github.com/Eyongkevin/django-boilerplate.git`
- Change the project name to your own project name: `mv django-boilerplate/ <your-project-name>`
- Add an `.env` file with the following configurations

```
SECRET_KEY=
DB_NAME=
DB_USER=postgres
DB_PWD=postgres
DB_HOST=127.0.0.1
DB_PORT=5432
```

### Using sqlite3

- If you want to use `sqlite3` as your database, then just the `SECRET_KEY` is required.
- The boilerplate is configured to use postgresql by default. So, to switch to sqlite3, move to the development settings at [config/settings/dev.py](https://github.com/Eyongkevin/django-boilerplate/blob/main/config/settings/dev.py) and adjust the database for sqlite3 by uncommenting for sqlite3 and commenting for postgresql.

#### Generate your SECRET_KEY

- We can generate this value in many ways, to do it with Python, we can use the `secrets` library. Run the following in your python shell

```bash
import secrets
secrets.token_urlsafe(50) # 'TwNkN-nrAtdYMt6rFVFGQ0znc1JPlAn64bLf5EgkeYX_GBZiVJfNR3EYyUaN91_P7PU'
```

- Get the generated token and set `SECRET_KEY`

```
SECRET_KEY=django-insecure-TwNkN-nrAtdYMt6rFVFGQ0znc1JPlAn64bLf5EgkeYX_GBZiVJfNR3EYyUaN91_P7PU
```

### Using postgresql

- In addition to setting up the `SECRET_KEY` above, we need to provide the configuration for postgresql
- Here, I am using the user `postgres` with password `postgres`. But you can always create a new role with a unique password

```bash
psql -U postgres

CREATE ROLE <role-name> WITH PASSWORD '<password>'

ALTER ROLE <role-name> CREATEDB;
ALTER ROLE <role-name> LOGIN;
```

#### Create database

```bash
\c postgres <role-name>

CREATE DATABASE <db-name>;
```

- After having created the user role, password and database, fill these values in the `.env`.

### Create new repo

If you clone the boilerplate, the git remote will reference this boilerplate. So, to reference your own repo, you can do a few things;

- Create a new repo on github, don't add anything like README.
- Update the remote of this boilerplate to reference the new repo you just created.

```bash
git remote set-url origin <your-repo-url>.git
```

- Set the main branch: `git branch -M main`
- Push to origin: `git push -u origin main`

## Boilerplate Structure

### Settings

In the `config/` folder, we have another folder; `settings/` that contains all the settings based on the environment you are running at. This boilerplate has two; `base.py` and `dev.py`. If you are developing locally, you will be using the `dev.py`. If you want to go to production, then you can create a setting for production. For example `prod.py`

### Requirements

Just like settings, we have a folder `requirements/` that contains requirement files based on the environment you are running. This boilerplate has two; `base.txt` and `dev.txt`. If you are developing locally, you will be using `dev.txt`. If you want to go to production, then you can create a requirement for production. For example `prod.py`

### Apps

All django applications should be created in the `apps/` folder. This way, all apps are grouped and easy to find.

To create a new app, we do the following;

- cd to the apps/ directory and run the startapp management command

```bash
python3 ../manage.py startapp <app-name>
```

Or use this Makefile command from the working directory

```bash
make dev-startapp app=<app-name>
```

#### core app

In the apps/ directory, we have an app called `core` and this should contain common stuffs that will be used in all other apps. For example, this app has a model called `CreatedModifiedAbstract` in the abstract/ folder. This is an abstract model that defines two fields; `created_at` and `modified_at`.

### Makefile

In order to run some very long commands using shortcuts, we have a `Makefile` that contains some commands for makemigrations, migration, installation, runserver and so on.

To run a command from the Makefile, we just run `make <command-name>` where `<command-name>` is a command in the Makefile
