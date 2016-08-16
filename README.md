# FtC Website
*Websystem for Free the Children, UBC. Created by Code the Change - UBC Chapter.*

[See site here during development.](nameless-river-95813.herokuapp.com)


### Project Info

- Rails version currently being used: 5.0.0. (See Gemfile)

- Deployment Instructions: 
  * **Locally**: 
	You can deploy on your local machine by typing "rails server" at the command line and visiting
	http://localhost:3000/
  * **Remotely**: 
	Run command "heroku open" in your command line. 
	If you've made changes and want to push to heroku, run "git push heroku <your_branch_name>:master", 
	which pushes changes from your local branch to the heroku master branch. 


- Test Suite
  * Run unit tests (found in directory /test) by typing "rails test" or "rake test:\<test_module>".   


- Configuration
  * Update the gems specified in the gemfile by running "bundle install"


 - Database
   * **Locally**
     1. To update database after update or adding a model run "rake db:migrate". This migrates the current schema. 
     2. To seed the database run "rake db:seed"
     3. To reset the database and reload the current database run "rake db:reset db:migrate"
     4. To destroy the database, create and migrate it run "rake db:reset db:migrate"
     5. After modifying the database, to run tests first run "rake db:test:prepare"
   * **Remotely (heroku)**
     1. To drop the database "heroku pg:reset DATABASE"
     2. To migrate the current schema "heroku run rake db:migrate"
     3. To populate the database with seed data "heroku run rake db:seed"
     4. To cover last two in one action, run "heroku run rake db:setup"


### TODO 
*See Milestones* 

- Allow users to sign up for event
- Update a user's profile to reflect their events


