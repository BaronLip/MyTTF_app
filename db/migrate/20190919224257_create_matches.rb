class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :player_id
      t.integer :opponent_id
      t.string :type

      t.timestamps
    end
  end
end
