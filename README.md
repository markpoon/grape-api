# Grape API Demo

This is a demo application that showcases how to write a rest-like application interface using grape.

Sample App running at : [http://grape-api.heroku.com/user](http://grape-api.heroku.com/user)

## Tech

[Grape](https://github.com/intridea/grape) of course which provides us with a dsl. Using [Mongoid](http://mongoid.org/en/mongoid/index.html), [Mongo](https://www.mongodb.org) for the backend with a yaml config file ready to be deployed onto [Heroku](http://www.heroku.com). [Forgery](https://github.com/sevenwire/forgery) is used to mockup some user names and emails.

## Deployment

If you already have a heroku account, simple run:

    heroku create [name of your app]
    git push heroku master

And you're done - have fun.
