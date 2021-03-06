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
			render :new
		end
	end

	def show
		@events = Event.order(:start_time).select { |event| !event.has_passed? }.first(3)
		@event = Event.find(params[:id])
		@volunteers = @event.users
	end

	def index
		@events = Event.all
		@fundraisers = Fundraiser.all
		if admin?
			@new_fundraiser = Fundraiser.new
		end
		@vow_of_silence_event = Event.where(vow_silence: true).order(:created_at).first
    	@ee_challenge_event = Event.where(ee_challenge: true).order(:created_at).first
    	@mini_we_day_event = Event.where(we_day: true).order(:created_at).first
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
										  :start_time, :duration, :ee_challenge,
										  :we_day, :vow_silence)
		end

end
