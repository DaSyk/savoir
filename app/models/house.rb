class House < ActiveRecord::Base
	belongs_to :location
	
	has_one :facility, :dependent => :destroy
	has_one :suitability, :dependent => :destroy
	has_one :pricing, :dependent => :destroy
	has_many :pictures, :dependent => :destroy
	has_many :bookings, :dependent => :destroy
	accepts_nested_attributes_for :suitability, :pricing, :pictures, :facility

	geocoded_by :address
	after_validation :geocode
	
	def change_activate
		if self.activated?
			self.update_attributes(:activated => false)
		else
			self.update_attributes(:activated => true)
		end
	end


end
