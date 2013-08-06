class Project < ActiveRecord::Base
  has_many :tickets
  attr_accessible :name, :description
  scope :admins, where(:admin => true)
  validates :name, :presence => true, :uniqueness => true
  has_many :permissions, :as => :thing
  
  def self.viewable_by(user)
    # returns all related Project models permitted to be viewed by user
    joins(:permissions).where(:permissions => { :action => "show",
                                                :user_id => user.id })
  end
  
  def self.find(user)
    user.admin? ? Project : Project.viewable_by(user)
    
    
  end
end
