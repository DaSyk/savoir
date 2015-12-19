class House < ActiveRecord::Base
	belongs_to :location, counter_cache: true

	has_one :facility, :dependent => :destroy
	has_one :suitability, :dependent => :destroy
	has_one :pricing, :dependent => :destroy
	has_many :pictures, :dependent => :destroy
	has_many :bookings, :dependent => :destroy
	has_and_belongs_to_many :suits
	has_and_belongs_to_many :facilities

	accepts_nested_attributes_for :pricing, :pictures, :facilities, :suits

	geocoded_by :address
	after_validation :geocode

	after_update :change_houses_count

	def change_activate
		if self.activated?
			self.update_attributes(:activated => false)
		else
			self.update_attributes(:activated => true)
		end
	end

	def change_houses_count
		self.location.region.change_houses_count if self.location
	end

end
