class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of :username, :email, :password
  has_many :tweets
end
