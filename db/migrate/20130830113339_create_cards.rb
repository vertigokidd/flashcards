class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.timestamps
    end
    # add_index :cards, :question :answer
  
  end
end
