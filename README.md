# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.1.2

* Configuration
make sure tahat you are using the correct ruby version, keep in mind tat you can adjust it using
rbenv or the ruby version manayer that you preferred
1) run:  bundler install

* Database creation

The DB of this project is handled by postgres, keep in mind that you will need set
up a new role following the steps below:

1. Signin in your postgres console: psql -U your_admin_user -h localhost -d postgres

2. From your console, create a new role: CREATE ROLE db_user WITH LOGIN PASSWORD 'db_password';
ask for the db_user and db_password to your manager or tech lead

------------------------------------------------------------
DATABASE_DEVELOPMENT_NAME='cloudnonic_tickeing_development'
DATABASE_DEVELOPMENT_USER='cloudnonic_ticketing'
DATABASE_DEVELOPMENT_PASSWORD='T00026742'
DATABASE_DEVELOPMENT_HOST='localhost'
----------------------------------------------------------

3. Provide the requred permisions to the new role rom the postgres console using: ALTER ROLE db_user CREATEDB

4. Proceed creating the db typing rails db:create on your terminal from the root of this project

5. Run the migratoin using: rails db:migrate

6. Run the seeds using: rails db:seed


* How to run the test suite
  The test for this project were created using rspc, to run them, just type rspec on you terminal from the root path

API examples requests:

SIGN UP:

[POST] => http://localhost:3000/api/v1/users
{ "api_v1_user": {"email": "morthudisater@gmail.com", "password": "02012T20019", "remember_me": 0 }}
