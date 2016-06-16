class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password
  include 'bcrypt'
  has_many :tweets
end
