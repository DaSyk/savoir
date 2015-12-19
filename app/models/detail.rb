class Detail < ActiveRecord::Base
  has_many :suits
  has_many :facilities
  accepts_nested_attributes_for :suits, :facilities
end
