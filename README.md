# README

Practice app to to set up a a working devcontainer development environment

## VS Code

* Docker
* Github
* Ruby
* Ruby Test Adapter
* VS Code task shortcuts in status bar

## Docker/Docker Compose

Set up using "docker-in-docker".
However the Ruby Test Adapter tries to require a CustomFormatter - however rspec is run through docker-compose, meaning the formatter from the extension is not avalible.

The Dockerfile copies the formatter from the repo to the path expected by the extension
