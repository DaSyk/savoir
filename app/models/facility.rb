class Facility < ActiveRecord::Base
  belongs_to :detail
	has_and_belongs_to_many :houses
  accepts_nested_attributes_for :houses
end
