class AddDateToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :date, :string
  end
end
