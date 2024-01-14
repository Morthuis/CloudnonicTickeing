# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.1.2

* Configuration
make sure tahat you are using the correct ruby version, keep in mind tat you can adjust it using
rbenv or the ruby version manayer that you preferred
1) run:  bundler install

## Database creation

The DB of this project is handled by postgres, keep in mind that you will need set
up a new role following the steps below:

1. Signin in your postgres console: psql -U your_admin_user -h localhost -d postgres

2. From your console, create a new role:
```
CREATE ROLE db_user WITH LOGIN PASSWORD 'db_password';
```
ask for the db_user and db_password to your manager or tech lead

## Environment variables

```
DATABASE_DEVELOPMENT_NAME='cloudnonic_tickeing_development'
```
```
DATABASE_DEVELOPMENT_USER='cloudnonic_ticketing'
```
```
DATABASE_DEVELOPMENT_PASSWORD='T00026742'
```
```
DATABASE_DEVELOPMENT_HOST='localhost'
```


3. Provide the requred permisions to the new role from the postgres console using
```
ALTER ROLE db_user CREATEDB
```

4. Proceed creating the db typing rails db:create on your terminal from the root of this project
```
rails db:create
```
5. Run the migratoin: 
```
rails db:migrate
```
6. Run the seeds: 
```
rails db:seed
```

## Tests
  The test for this project were created using rspc, to run them, just type rspec on you terminal from the root path

## Api requests for Users

SIGN UP [POST]
```
http://localhost:3000/api/v1/users.json
```
```
{ "api_v1_user": {"email": "morthudisater@gmail.com", "password": "02012T20019"}}
```
SIGN IN [POST]
```
http://localhost:3000/api/v1/users/sign_in.json
```
```
{ "api_v1_user": {"email": "morthudisater@gmail.com", "password": "02012T20019", "remember_me": 0 }}
```
SIGN OUT [DELETE]
```
http://localhost:3000/api/v1/users/sign_out 
```

## Api requests for Events

CREATE AN EVENT [POST]
```
http://localhost:3000/api/v1/events
```
```
{ "name": "Great event", "description": "You will enjoy so much", "location": "Las vegas", "start_time": " 2024-01-13 03:00:07.290192699 -0500", "end_time": " 2024-01-13 03:00:07.290192699 -0500", "ticket_price": 200, "tickets_threshold": 500 }
```
LIST OF ALL EVENTS [GET]
```
http://localhost:3000/api/v1/events
```

SHOW AN SPECIFIC EVENT DETAILS [GET]
```
http://localhost:3000/api/v1/events/1
```
EDIT AN EVENT [PUT]
Keep in mind that you must be the event owner to updated, for another and only if the ticket_price is updated, the api will recailculate the total_price of all tickets asociated to this event
```
http://localhost:3000/api/v1/events/4
```
```
{ "name": "New name", "description": "You will enjoy so much x2", "location": "Las vegas", "start_time": " 2024-01-13 03:00:07.290192699 -0500", "end_time": " 2024-01-13 03:00:07.290192699 -0500",  "ticket_price": 5, "tickets_threshold": 500}
```
## Api requests for Tickets

CREATE A TICKET [POST]
```
http://localhost:3000/api/v1/tickets 
```
```
{ "buyer_name": "Moises H", "quantity": 10, "event_id": 3 }
```
SHOW AN SPECIFIC TICKET DETAILS [GET]
```
http://localhost:3000/api/v1/tickets/1
```
LIST THE TICKETS ASOCIATED TO AN SPECIFIC EVENT_ID [GET]
```
http://localhost:3000/api/v1/event_tickets/1
```
EDIT A TICKET [PUT]
```
http://localhost:3000/api/v1/tickets/8
```
```
{ "buyer_name": "Moises Acosta", "quantity": 5 }
```
TICKETS AVAILABILITY [GET]
Report how many available tickets an specific event has
```
http://localhost:3000/api/v1/tickets_availability/3
```
