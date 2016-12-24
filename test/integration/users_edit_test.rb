require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
	def setup
		@user = users(:tester)
	end

	test "unsuccesful edit due to no name and invalid email address" do 
		log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), params: { user: { name: "", 
		                                		  email: "foo@invalid", 
		                                		  password: "", 
		                                		  password_confirmation: "" } }
 		assert_template 'users/edit'
 	end

 	test "unsuccesful edit due to wrong password confirmation" do 
		log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), params: { user: { name: "valid name", 
		                                		  email: "foo@invalid.com", 
		                                	      password: "foo", 
		                                		  password_confirmation: "notfoo" } }
 		assert_template 'users/edit'
 	end

 	test "successful edit with friendly forwarding" do
 		get edit_user_path(@user)
		log_in_as(@user)
		assert_redirected_to edit_user_path(@user)
 		name  = "Foo Bar"
    	email = "foo@bar.com"
    	patch user_path(@user), params: { user: { name:  name,
        	                            	   	  email: email,
           	                            		  password:              "",
               	                        		  password_confirmation: "" } }
    	assert_not flash.empty?
    	assert_redirected_to edit_user_path(@user)
    	@user.reload
    	assert_equal name,  @user.name
    	assert_equal email, @user.email
    	assert_equal nil, session[:forwarding_url]
  	end

end
