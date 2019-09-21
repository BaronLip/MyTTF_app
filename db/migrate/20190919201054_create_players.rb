class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
        t.string :username
        t.string :email
        t.integer :ranking
        t.string :wins
        t.string :losses
        t.string :gender

        t.timestamps
    end
  end
end
