class Region < ActiveRecord::Base
	has_many :locations
	belongs_to :country

	accepts_nested_attributes_for :locations

end
