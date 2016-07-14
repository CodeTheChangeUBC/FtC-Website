class Event < ApplicationRecord
	attr_accessor :num_volunteers, :start_time, :length
	validates :title, presence: true
	validates :description, presence: true
end
