class User < ActiveRecord::Base
  rolify
  has_secure_password

  has_many :comments
  has_many :posts

  validates :password, length: { minimum: 8 }
  validates_confirmation_of :password
end
