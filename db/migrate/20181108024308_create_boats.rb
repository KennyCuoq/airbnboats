class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :location
      t.integer :daily_price
      t.integer :capacity
      t.integer :crew_number
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
