require 'CSV'

deck = Deck.create!(:name => "computer")

# deck.cards = [array of all card objects]
# deck.cards << shovel things in here

CSV.foreach('cards.csv') do |row|
  deck.cards << Card.create!(:question => row[1], :answer => row[0])
end     
