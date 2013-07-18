class Project < ActiveRecord::Base
  has_many :tickets
  attr_accessible :name, :description
  
  validates :name, :presence => true
end
