class Event < ApplicationRecord
	attr_accessor :num_volunteers, :start_time, :duration, :date
	# Duration is in hours
	validates :title, presence: true
	validates :description, presence: true
end
