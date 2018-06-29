# GrapeTemplate Readme

[![Build Status](https://travis-ci.com/WeTransfer/wallpaper_wizard_backend.svg?token=TvYqzBunqky95yiy5WaA&branch=master)](https://travis-ci.com/WeTransfer/wallpaper_wizard_backend)

## This is the GrapeTemplate

It runs on Ruby on Grape and is used as an REST API

### Database
The database is a Postgres setup
```
CREATE DATABASE grapetemplate_dev;
CREATE DATABASE grapetemplate_test;
```

Configure the database in `config/config.yml` .

<!-- **Before running the migration, you have to disable the models.** -->

Run `$ rake db:migrate` to execute pending migrations.
Run `$ rake db:seed ` to seed the database.

###### Optional
It's also possible to use a sqlite for development.
you have to include the sqlite gem and specify the sqlite path in the config.yml. like: `'sqlite://db/grapetemplate.sqlite3'`

#### Creating migrate files
`$ rake db:create_migration[create_new_table]`
if you are using `zsh` you have to wrap the the rake method in quotes like this: `$ rake 'db:create_migration[create_new_table]'`


### Testing
Rspec is used for testing.
Run `$ guard` to keep your changes tested

### Starting Application
Run `$ bundle` to install all the gems.

### Additional info

To get all the rake tasks, run:
`$ rake -T`

To get the routes from the api, use:
`$ rake routes`

To run the backend
`$ rackup`

To run in shell
`$ racksh`

To change the envirionment:
`$ RAKE_ENV=prodcution rackup/racksh`
