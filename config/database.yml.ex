# SQLite version 3.x
#   gem install sqlite3-ruby (not necessary on OS X Leopard)
development:
  adapter: sqlite3
  database: db/development.sqlite3
  timeout: 5000

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: sqlite3
  database: db/test.sqlite3
  timeout: 5000

production:
  adapter: sqlite3
  database: db/production.sqlite3
  timeout: 5000

#
#POSTGRES
#
#development:
#  adapter: postgresql
#  encoding: unicode
#  database: arx_development
#  username: postgres
#  password:

#test:
#  adapter: postgresql
#  encoding: unicode
#  database: arx_test
#  username: postgres
#  password:
