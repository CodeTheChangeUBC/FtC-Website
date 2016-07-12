class ContactFormMessage < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true
	validates :email, presence: true,
					  format: { with: VALID_EMAIL_REGEX }
	validates :content, presence: true, length: { minimum: 20, maximum: 1000 }
end
