require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  has_many :friends_as_follower, class_name: 'Friend', foreign_key: :follower_id
  has_many :friends_as_followee, class_name: 'Friend', foreign_key: :followee_id
  has_many :followers, through: :friends_as_follower
  has_many :followees, through: :friends_as_followee

  validates_presence_of :name, :email, :password
  validates :email, uniqueness: true
  has_many :tweets

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(args)
    @user = User.find_by(email: args[:email])
    @user && @user.password == args[:password] ? @user : nil
  end
end
