require 'bcrypt'

my_password = BCrypt::Password.create("my password")
p my_password

p my_password.version
p my_password.cost
p my_password == "my password"
p my_password == "not my password"

my_password = BCrypt::Password.new("$2a$12$aQGTZrqNXq1ZSwoaPFJjuOttLi9e9lZpthsMugnBFse5CmFpvxWZ.")
p my_password == "my password"
p my_password == "not my password"