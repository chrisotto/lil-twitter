class Tweet < ActiveRecord::Base
  validates :body, numercality:  { :less_than_or_equal_to => 140 }
  include 'bcrypt'
  belongs_to :user

end
