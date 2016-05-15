# Goats and Soda
## Built with Ruby on Rails

### Authors
[Hedy Woo](https://github.com/thePaulista), [Kris Foss](https://github.com/kristindiannefoss), [Jon Liss](https://github.com/jdliss), [Jared Roth](https://github.com/JaredRoth)


This project was created as a part of the curriculum for the [Turing School of Software & Design](http://turing.io).

### Overview

This Rails application is a microdonation site. A user can create an account and donate available items to multiple recipients. A recipient is an "admin" user for their "store", they can select predetermined needs from the catalog to request specific donations.  A master admin user can edit information with recipients and donors.  The code is "pivoted" off of a module 2 little shop to practice multi-tenancy.  

### Live Version

You can find a live version of this application on Heroku at: [https://goatsandsoda.herokuapp.com/](https://goatsandsoda.herokuapp.com/)

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `git clone https://github.com/kristindiannefoss/little_shop.git`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `rake db:create db:migrate db:seed` to set up the postgres database and seed it with users, items, and categories.
    - If you would like to create your own users, artist, items, and categories do not run `db:seed`
    - The seed file does not include any setup for admins, so those must be created manually by running `rails c` and adding a user to the database with role = 2
  5. Run the application in the dev environment by running `rails s`

### App Features

Some of the main features of the app include:

#### Users

Users can browse the items by category. Each item has a name, description, image, and price associated with it. Users can add any items to their cart. Users do not need to be signed in to browse items or add them to their cart. However, upon checkout, if a user is not signed in they will be asked to create an account or login before being allowed to check out. A user cannot add any items.  However, once they are signed up as a recipient, they cannot change back to a default user. Users can also view any of their past donations and the donation status.

#### Admins

Admins can add requested items from the catalog.

### Test Suite

The test suite tests the application on multiple levels. To run all of the tests, run `rake spec` from the terminal in the main directory of the project. The feature tests (integration tests) rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

The project also utilizes leverages a bootstrap template.

### Dependencies

This application depends on many ruby gems, all of which are found in the `Gemfile` and can be installed by running `bundle install` from the terminal in the main directory of the project.
