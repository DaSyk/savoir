class Location < ActiveRecord::Base
  has_many :houses
  belongs_to :region
  accepts_nested_attributes_for :houses

end
