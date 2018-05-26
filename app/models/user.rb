class User < ActiveRecord::Base
  has_secure_password
  has_many :topics
  validates :email, :password_digest, :presence => true
  validates :email, :password_digest, :uniqueness => true


end
