class CreateOpponents < ActiveRecord::Migration[5.2]
  def change
    create_table :opponents do |t|
        t.string :username
        t.integer :ranking
        t.string :wins
        t.string :losses
        t.string :gender

        t.timestamps
    end
  end
end
