class Booking < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :house

  validates :start_date, :end_date, :firstname, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


  def change_accepted
    if self.accepted?
	    self.update_attributes(:accepted => false)
	 else
	    self.update_attributes(:accepted => true)
	 end
  end

end
