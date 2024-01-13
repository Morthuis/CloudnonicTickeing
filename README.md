# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

The DB of this project is handle by postgres, keep in mind that you will need set
up a new role following the steps below:

1. Signin in your postgres console: psql -U your_admin_user -h localhost -d postgres

2. From your console, create a new role: CREATE ROLE db_user WITH LOGIN PASSWORD 'db_password';
ask for the db_user and db_password to your manager or tech lead

3. Provide the requred permisions to the new role using: ALTER ROLE db_user CREATEDB


4. Proceed creating the db typing rails db:create on your terminal from the root of this project

5. Run the migratoin using: rails db:migrate

6. Run the seeds using: rails db:seed

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
