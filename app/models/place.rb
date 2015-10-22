class Place < ActiveRecord::Base
  has_many :countries, :dependent => :destroy

  accepts_nested_attributes_for :countries
end
