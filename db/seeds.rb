# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# These first two users will be an admin and example user everywhere, includiing in production. 
User.create!(name:  "Admin",
             email: "admin@freethechildren.com",
             password:              "foobar",
             password_confirmation: "foobar", 
             admin: true)

User.create!(name:  "Example User",
             email: "test@foobar.com",
             password:              "foobar",
             password_confirmation: "foobar")


# These test users will only populate a database in development mode. 
if Rails.env.development?  
	99.times do |n|
  		name  = Faker::Name.name
  		email = "example-#{n+1}@foobar.org"
  		password = "password"
  		User.create!(name:  name,
        	       	 email: email,
            	   	 password: password,
               		 password_confirmation: password)
  end
	
end