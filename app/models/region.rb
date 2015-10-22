class Region < ActiveRecord::Base
	has_many :houses
	belongs_to :country

	accepts_nested_attributes_for :houses

end
