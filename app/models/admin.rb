class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable,  and :omniauthable
  devise :database_authenticatable, :rememberable, :timeoutable, :registerable

end