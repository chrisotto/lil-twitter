class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of :username, :email, :password
  validates :email, uniqueness: true
  has_many :tweets
end
