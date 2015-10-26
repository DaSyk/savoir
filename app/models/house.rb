class House < ActiveRecord::Base
	belongs_to :region
	
	has_one :facility, :dependent => :destroy
	has_one :suitability, :dependent => :destroy
	has_one :pricing, :dependent => :destroy
	has_many :pictures, :dependent => :destroy
	has_many :bookings, :dependent => :destroy
	accepts_nested_attributes_for :suitability, :pricing, :pictures, :facility

	def change_activate
		if self.activated?
			self.update_attributes(:activated => false)
		else
			self.update_attributes(:activated => true)
		end
	end


end
