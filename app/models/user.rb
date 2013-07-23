class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :confirmable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  attr_accessible :email, :password, :admin, :as => :admin
  # attr_accessible :title, :body
  
  def to_s
    # applies to both links of user and user.email
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
