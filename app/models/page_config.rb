class PageConfig < ActiveRecord::Base
  has_many :pages
  accepts_nested_attributes_for :pages
end
