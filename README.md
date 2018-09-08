# Ride My Way Lagos 
[![Coverage Status](https://coveralls.io/repos/github/Maxcutex/ride-my-way-lagos/badge.svg?branch=develop)](https://coveralls.io/github/Maxcutex/ride-my-way-lagos?branch=develop)
[![CircleCI](https://circleci.com/gh/Maxcutex/ride-my-way-lagos.svg?style=svg)](https://circleci.com/gh/Maxcutex/ride-my-way-lagos)
[![Maintainability](https://api.codeclimate.com/v1/badges/2b94c663003f880331b1/maintainability)](https://codeclimate.com/github/Maxcutex/ride-my-way-lagos/maintainability)


Ride My Way Lagos  is a responsive web application allows you to schedule a ride and the number of followers for your ride.

https://ride-my-way-lagos.herokuapp.com/

The application provides option of subscribing for a ride and unsubscribing from a ride. 

## Usage
Using  [Ruby Version Manager](https://rvm.io/rvm/install) download and install the latest version of ruby, which can be downloaded from [here](https://www.ruby-lang.org/en/downloads/).

The application is built with Ruby on Rails

To clone the respository execute the following command.
```
git clone https://github.com/maxcutex/microlearningapp.git
```
Navigate into the cloned project directory.

Edit the `env-sample` file with your gmail creadentials and save it as `.env`

Change the parameters in there to your own settings e.g SEND GRID KEY

On the prompt execute the following 
```
export $(cat .env)
```


Execute the following code to install all the application dependencies.
```
bundle install
```

Execute the following code to migrate all data tables/object
```
rails db:migrate
```

Execute the following code to seed data
```
rails db:seed
```

Execute the following at the command line
```
rails s
```

Browse the application in the url
```
http://localhost:3000
```

### Features of Ride My Way Lagos App
- Signup with username, email and password
- Login with email and password
- View rides available
- Create a ride schedule



### Testing
Tests can be run using
```
rspec
```