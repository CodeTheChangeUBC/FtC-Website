class Fundraiser < ApplicationRecord
	validates :target, presence: true, 
					   numericality: { greater_than: 0 }
	validates :progress, presence: true, 
					     numericality: { greater_than_or_equal_to: 0 }
	validate :valid_fundraising_values
	
	private 

		def valid_fundraising_values
			return if progress.blank? or target.blank?
			if progress < 0 or target <= 0 or target < progress
				errors.add(:progress, "Progress cannot be less than target")
			end
		end
end
