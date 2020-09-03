# AceBook (Rails Facebook Clone)

## Project on heroku:

http://********.herokuapp.com

## Instructions to use locally:

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Wireframe

## Database Schema


## User Stories

### Sign-up

```
As a new User
So that I can sign up easily
I would like to be able to sign up on the homepage

As a new User
So that I know if I am not signed in
I would like to directed to sign up if I am not

As a new User
So that I can sign up
I would like to provide my name, email address and password

As a new User
So that I can sign up easily
I would like the validity of my email address format to be checked

As a new User
So that I can start using Acebook quickly
I would like to directed to All Posts after signing up

As a new User
So that I know I have successfully signed up
I would like to see a welcome message

As a new User
So that I am not confused with another user
I would like to be blocked from signing up with another user's name or email

As a new User
So that I do not have to keep signing up
I would like my sign up to be remembered

```

### Login

```
As a User
So that I can login easily
I would like to login from the homepage

As a User
So that I can login
I would like to be told if I have entered my details incorrectly

As a User
So that I know my login has been successful
I would like to see a welcome message

As a User
So that I can start using Acebook quickly
I would like to directed to All Posts after login

As a User
So that I can navigate around and make use of the website
I would like my login to be remembered
```

### Posts

```
As a User
So that I can login easily
I would like to login from the homepage
```

### Comments

### Likes

### Wall
