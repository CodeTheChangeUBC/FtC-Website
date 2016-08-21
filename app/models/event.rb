class Event < ApplicationRecord
	attr_accessor :num_volunteers, :start_time, :duration, :date
	# Duration is in hours
	has_and_belongs_to_many :users
	validates :title, presence: true
	validates :description, presence: true
end
