class Country < ActiveRecord::Base
	has_many :regions, :dependent => :destroy
	belongs_to :place
	accepts_nested_attributes_for :regions
end
