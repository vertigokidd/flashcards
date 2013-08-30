  # Remember to create a migration!

class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user  
end
