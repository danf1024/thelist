class AddTableIdToGuests < ActiveRecord::Migration[5.1]
  def change
    add_reference :guests, :table, foreign_key: true, index: true
  end
end
