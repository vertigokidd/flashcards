class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :email, :password, presence: true 
  has_many :rounds
end
