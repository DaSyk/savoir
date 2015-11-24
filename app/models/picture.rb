class Picture < ActiveRecord::Base
	belongs_to :house
	mount_uploader :image, ImageUploader
	crop_uploaded :image

	validates :name, uniqueness: true

	before_create :default_name

	def default_name
		self.name ||= File.basename(image.filename, '.*').titleize if image
	end

	def change_to_def
		self.house.pictures.each do |p|
			p.update_attribute(:default_pic, false)
		end
		self.update_attribute(:default_pic, true)
	end

end
