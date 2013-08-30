require 'CSV'

Deck.create!(:name => "computer")

CSV.foreach('cards.csv') do |row|
  Card.create!(:question => row[1], :answer => row[0])
end     
