class EventsController < ApplicationController
	before_action :admin_user, only: [:new, :update, :destroy]

	def new
	end

	def show
	end

	def index
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private 

		# Verifies if current user is an admin
		def admin_user
			redirect_to(root_url) unless admin?
		end


end
