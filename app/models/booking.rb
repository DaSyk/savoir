class Booking < ActiveRecord::Base
  belongs_to :house
  
  def change_accepted
    if self.accepted?
	  self.update_attributes(:accepted => false)
	else  
	  self.update_attributes(:accepted => true)
	end  
  end
  
end
