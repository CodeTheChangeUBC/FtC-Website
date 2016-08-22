class Article < ApplicationRecord
	validates :title, presence: true
	validates :text, presence: true
	mount_uploader :image1, ArticleImagesUploader
	mount_uploader :image2, ArticleImagesUploader
	mount_uploader :image3, ArticleImagesUploader
	mount_uploader :image4, ArticleImagesUploader
	validate :image_size

	def remove_picture(picture_id)
		if picture_id === '1'
			self.remove_image1!
			self.save
		elsif picture_id === '2'
			self.remove_image2! 
			self.save
		elsif picture_id === '3'
			self.remove_image3! 
			self.save
		elsif picture_id === '4'
			self.remove_image4! 
			self.save
		end
	end

	private 

	# Validates the size of an uploaded avatar
    def image_size
      4.times do |i|
      	photo = "image#{i+1}"
      	if eval(photo).size > 5.megabytes
        	errors.add(:picture, "should be less than 5MB")
      	end
      end
  	end

end
