# README

Playing with Rails 5.2 and Active Storage (using ruby-2.4.0).

### Notes

sqlite3 db/development.sqlite3 .dump > dump.sql

### API

Documentation: [http://aa.usno.navy.mil/data/docs/api.php](http://aa.usno.navy.mil/data/docs/api.php)

curl "http://api.usno.navy.mil/imagery/moon.png?date=6/09/1900&time=5:13" --output dude1.png

### RSpec Generator
rails generate rspec:model user

rails generate rspec:request users

### Run all specs in the spec/ directory
bundle exec rspec

### Run specs in spec/requests
bundle exec rspec spec/requests

### Run only specs for AccountsController
bundle exec rspec spec/controllers/accounts_controller_spec.rb

### Run only spec on line 8 of AccountsController
bundle exec rspec spec/controllers/accounts_controller_spec.rb:8