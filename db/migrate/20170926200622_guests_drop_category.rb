class GuestsDropCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column :guests, :category, :string, null: false
  end
end
