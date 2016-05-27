class User < ActiveRecord::Base

  attr_accessor :password
  validates :username, :presence => true, :uniqueness => true, 
            :length => {:in => 3..20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, :uniqueness => true, format:
            { with: VALID_EMAIL_REGEX }
            
  validates :password, :confirmation => ture
  validates_length_of :password, :in => 6..20, :on => :create
  
  before_save :encrypt_password
  after_save :clear_password
end
