class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.integer :number, null: false
      t.string :description, null: false
      t.timestamps null: false
    end
  end
end
