class Event < ApplicationRecord
	attr_accessor :num_volunteers, :duration
	# Duration is in hours
	has_and_belongs_to_many :users
	validates :title, presence: true
	validates :description, presence: true
	validates :start_time, presence: true
	
end
