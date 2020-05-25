class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :daily_fee
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
