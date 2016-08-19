class FundraisersController < ApplicationController
	before_action :admin_user, only: [:create, :update, :destroy]

	def create 
		@fundraiser = Fundraiser.new(fundraiser_params)
		if @fundraiser.save
			flash[:success] = "Fundraising bar created successfully. Yahoo!"
			redirect_to events_url
		else
			flash[:warning] = "Failed to create new fundraiser. Please try again."
			redirect_to events_url
		end
	end

	def edit
		@fundraiser = Fundraiser.find(params[:id])
	end

	def update
		@fundraiser = Fundraiser.find(params[:id])
		if @fundraiser.update_attributes(fundraiser_params)
			flash[:success] = "Fundraiser updated successfully!"
			redirect_to events_url
		else
			flash[:warning] = "Woops, something went wrong.	
								Please try again. "
			redirect_to events_url
		end
	end

	def destroy
		Fundraiser.find(params[:id]).delete
		flash[:success] = "Fundraiser deleted successfully"
		redirect_to events_url
	end

	private 

		def fundraiser_params
			params.require(:fundraiser).permit(:target, :progress)
		end
end
