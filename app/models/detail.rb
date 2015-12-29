class Detail < ActiveRecord::Base
  has_many :suits, :dependent => :destroy
  has_many :facilities, :dependent => :destroy
  accepts_nested_attributes_for :suits, :facilities, :allow_destroy => true
end
