# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Admin user
User.create!(name:  "Admin",
             email: "admin@freethechildren.com",
             password:              "freethem!children",
             password_confirmation: "freethem!children", 
             activated: true,
             activated_at: Time.zone.now,
             admin: true)

if Rails.env.development?
  9.times do |n|
    name = "Executive #{n+1}"
    email = "Executive#{n+1}@example.com"
    password = "fake_password"
    User.create!(name: name, 
                 email: email, 
                 password: password, 
                 password_confirmation: password,
                 about: "This is some stuff about me! " * 20,
                 activated: true,
                 activated_at: Time.zone.now, 
                 exec: true)
  end

  # Example user, non-admin. 
  User.create!(name:  "Example User",
               email: "test@foobar.com",
               password:              "foobar",
               password_confirmation: "foobar",
               about: "This is some stuff about me! " * 20, 
               activated: true,
               activated_at: Time.zone.now)


  # For now, populate database with fake users. 
  50.times do |n|
   		name  = Faker::Name.name
   		email = "example-#{n+1}@foobar.org"
  		password = "password"
   		User.create!(name:  name,
         	       	 email: email,
             	   	 password: password,
              		 password_confirmation: password,
                   about: "This is some stuff about me! " * 20, 
                   activated: true,
                   activated_at: Time.zone.now)
  end

  # For now, populate the database with fake documents

  # Public documents
  10.times do |n|
    name = "Public Document #{n+1} (Fake, Will not open)"
    attachment_url = "fake_url"
    Document.create!(name: name, 
                     attachment: attachment_url, 
                     public: true)
  end

  # Private documents
  10.times do |n|
    name = "Member Only Document #{n+1} (Fake, Will not open)"
    attachment_url = "fake_url"
    Document.create!(name: name, 
                     attachment: attachment_url)
  end

  # Articles
  12.times do |n|
    title = "Club Update #{n+1}"
    text = "This is a club update. " * 50
    Article.create!(title: title, text: text)
  end

  # Fundraiser
  Fundraiser.create!(title: "Example Fundraiser", 
                     description: "This is an example fundraiser" * 15, 
                     progress: 362, 
                     target: 500)

  # Events
  20.times do |n|
    title = "Event #{n}"
    description = "FTC Event."
    start_time = Date.today + 2*n
    Event.create!(title: title, 
                  description: description, 
                  start_time: start_time)

  end
end





	