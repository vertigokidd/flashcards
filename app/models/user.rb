class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds

  def self.validate(email, password)
    user = self.find_by_email(email)
    if user !nil
      user.password == password
    else
      false
    end
  end

end
