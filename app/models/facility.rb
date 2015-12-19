class Facility < ActiveRecord::Base
	has_and_belongs_to_many :houses

  accepts_nested_attributes_for :houses
end
