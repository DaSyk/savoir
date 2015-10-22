class Pricing < ActiveRecord::Base
	has_many :periods, :dependent => :destroy
	has_many :costs, :dependent => :destroy
	belongs_to :house
	accepts_nested_attributes_for :periods, :costs, :allow_destroy => true
end
