class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private 
  	# Verifies if current user is an admin
	def admin_user
		unless admin? 
			flash[:danger] = "Only administrators have access to this page"
			redirect_back_or(root_url) 
		end
	end
end
