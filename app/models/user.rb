class User < ActiveRecord::Base
  include BCrypt
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
