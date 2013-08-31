class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :deck
      t.string :question
      t.string :answer
      t.timestamps
    end
    # add_index :cards, :question :answer

    create_table :guesses do |t|
      t.belongs_to :round
      t.belongs_to :card
      t.boolean    :correctness
      t.timestamps
    end

  end
end
