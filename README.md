# Prop-suite
This is a platform where clients can check for available property(apartment) postings, contact the sellers, then review the sellers after a transaction. The app's original theme both in design and functionaly is built to mimic [Twitter](https://www.twitter.com), so users also have to option to follow other users. The app is mobile-responsive.

## Live version
The website is hosted on heroku here => [propsuite](https://tranquil-meadow-73761.herokuapp.com/).

## Outline
- Description and
- Live version (above).
- Features
- Technologies used
- Installation
- Endpoints
    - auth
    - users
    - apartments
    - followings
    - reviews
    - search
- Author
- Licence

## Features

The app has two levels of authorization;
- A regular client can
    - view public documents on the website(apartments, agents' reviews, followers).
    - signup for an account to be able to use the service.
    - search for an apartment by address, category, price.

- A user has all the privileges of a regular client and can also perform the following actions:
    - Log in to use their account.
    - Add a new apartment posting with multiple photos.
    - review a seller after a transaction.
    - follow other users.
    - update their profiles including avatar and coverphoto uploads.
    - Log out of their account.
    - Delete their account.

## Technologies
- The application was developed with [Ruby](https://www.ruby-lang.org/en/) backend and [Rails](https://rubyonrails.org/) is used for the frontend.
- [Postgres](https://www.postgresql.org/) for database management.
- All apartment, user avatar and coverphoto images are hosted on [Cloudinary](https://cloudinary.com/).
- [Sass](https://sass-lang.com/) and pure CSS for styling.
- [Stimulus Js](https://stimulusjs.org/) for adding functional responsiveness(click events management).
- [Webpacker](https://github.com/rails/webpacker) for managing javascript assets.
- [Github Actions](https://github.com/features/actions) and [Travis CI](https://travis-ci.org/) for CI.
- [Rspec](https://rspec.info/) and [Capybara](https://github.com/teamcapybara/capybara) for UI, unit and integration tests.

## Installation
Follow the steps below to setup a local development environment. First ensure you have [postgres](https://www.postgresql.org/) installed, and a version of [Ruby on Rails](https://rubyonrails.org/) equal to or greater than v5.2.3 .

1. Clone the repository from a terminal `git clone https://github.com/codecell/prop-suite`.
2. Navigate to the project directory `cd prop-suite`
3. Install project dependencies `bundle install`
4. Start the rails server `rails server`
5. Visit localhost:3000 and Voila!!!

## Entity Relationship Diagram
   ![image](https://user-images.githubusercontent.com/46686100/89930724-172c1900-dc03-11ea-8849-36071e5d3b1c.png)

## Endpoints
### Auth
EndPoint                       |   Functionality
-------------------------------|------------------------
POST /users/sign_up            |   Allows a client to create an account.
POST /users/sign_in            |   signs in a user into their account(session).

### Users
EndPoint                       |   Functionality
-------------------------------|------------------------
GET  /users                    |   Allows a user to view who to follow.
GET  /users/user_id            |   Allows a user to view another user's page, view followers.
GET  /users/user_id/edit       |   Allows a user to view and alter profile fields for update.
PATCH /users/user_id           |   Allows a user update their profiles.

### Apartments
EndPoint                       |   Functionality
-------------------------------|------------------------
GET /apartments                |   Allows a client to view all apartments.
GET /apartments/:apartment_id  |   Allows a client to view a specific apartment.
POST /apartments               |   Allows a user to create an apartment.

### Following
EndPoint                       |   Functionality
-------------------------------|------------------------
POST /followings               |   Allows user to follow another user.

### Reviews
EndPoint                       |   Functionality
-------------------------------|------------------------
GET /users/user_id/reviews     |   Allows an client to view a user's reviews.
POST /users/user_id/reviews    |   Allows user to review another user.

### Search
EndPoint                       |   Functionality
-------------------------------|------------------------
GET /searches/new              |   Allows a client enter search fields.
POST /searches                 |   Allows a client to search for apartments.

## Author

👤 **Alfred Ezaka**

- Github: [@codecell](https://github.com/codecell)
- Twitter: [@the_codecell](https://twitter.com/the_codecell) 
- Linkedin: [ezaka alfred](https://www.linkedin.com/in/alfrednoble/)

## Show your support

Give a ⭐️ if you like this project!

## Licence
- MIT