class EventsController < ApplicationController
	before_action :admin_user, only: [:new, :edit, :update, :destroy]

	def new
	    @event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:success] = "Event created successfully"
			redirect_to @event
		else 
			flash[:alert] = "Oops, something went wrong. Please try again."
			render :new
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def index
		@events = Event.all
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			flash[:success] = "Event updated!"
			redirect_to @event
		else
			flash[:alert] = "Update failed."
			render :edit
		end
	end

	def destroy
		Event.find(params[:id]).destroy
		flash[:success] = "Event deleted successfully"
		redirect_to events_url
	end

	private 

		def event_params
			params.require(:event).permit(:title, :description, :num_volunteers, 
										  :start_time, :duration, :date)
		end

		# Verifies if current user is an admin
		def admin_user
			unless admin? 
				flash[:danger] = "Only administrators have access to this page"
				redirect_back_or(root_url) 
			end
		end
end
