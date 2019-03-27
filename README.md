# MakersBnB specification
We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

## Running The Application
In the terminal use the command `bundle install` to get all the necessary gems.

You'll need to set up production and test databases locally - to do this use the command `psql` in the terminal, followed by each of the commands in `db/production_dbsetup.sql` and `db/test_dbsetup.sql`.

To run the app use the command `rackup` in the terminal and visit the port specified in the terminal, in a browser (e.g. 'localhost:9292').

## Specifications
Headline specifications
Any signed-up user can list a new space.
Users can list multiple spaces.
Users should be able to name their space, provide a short description of the space, and a price per night.
Users should be able to offer a range of dates where their space is available.
Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
Nights for which a space has already been booked should not be available for users to book that space.
Until a user has confirmed a booking request, that space can still be booked for that night.
Nice-to-haves
Users should receive an email whenever one of the following happens:
They sign up
They create a space
They update a space
A user requests to book their space
They confirm a request
They request to book a space
Their request to book a space is confirmed
Their request to book a space is denied
Users should receive a text message to a provided number whenever one of the following happens:
A user requests to book their space
Their request to book a space is confirmed
Their request to book a space is denied
A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
Basic payment implementation though Stripe.
Mockups
Mockups for MakersBnB are available here.


## testing in irb
require './lib/db_connection.rb'
require './lib/listings.rb'
require './lib/user.rb'
User.add(email: 'x', phone_num: 'y', password: 'z')
User.find(email: 'x')
User.authenticate(email: 'x', password: 'z')
Listing.add(property_name: "house", price: 340, description: "beautiful", user_id: 6, start_date: "2019-03-15", end_date: "2019-03-18")
Listing.filter(start_date: "2019-03-16", end_date:"2019-03-17")
Listing.return_filtered_listings

## System diagrams

Our database has two tables to reflect the two different classes used in our application - `User` and `Listing`:

![database set-up](/system-diagrams/db-diagram.jpg)
