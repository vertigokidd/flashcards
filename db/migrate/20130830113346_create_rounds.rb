class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :number_guessed
      t.integer :number_correct
      t.timestamps
    end
  end
end
