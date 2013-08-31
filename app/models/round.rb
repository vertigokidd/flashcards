  # Remember to create a migration!

class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses




  def update_stats(guess_count, correct_count)
    guessed = self.number_guessed
    correct = self.number_correct
    guessed += guess_count
    correct += correct_count
    self.update_attributes(number_guessed: guessed,
                           number_correct: correct)
  end

end
