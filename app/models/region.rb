class Region < ActiveRecord::Base
	has_many :locations
	belongs_to :country
	accepts_nested_attributes_for :locations

  def change_houses_count
    cnt = 0
    self.locations.each do |l|
      cnt += l.houses_count
    end
    self.update_attributes(:houses_count => cnt)
  end

end
