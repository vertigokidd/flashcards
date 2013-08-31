class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  validates :name, :email, :password, presence: true
  validates :password, length: {minimum: 8}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}, uniqueness: true


  def self.validate(email, password)
    user = self.find_by_email(email)
    if user == nil
      return false
    else
      return user.password == password
    end
  end


  # def rounds=(rounds)
  #   self.rounds << Round.create
  # end

end
