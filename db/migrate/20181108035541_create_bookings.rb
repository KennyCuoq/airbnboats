class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :boat, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :status, default: "requested"
      t.integer :passenger_number
      t.integer :total_price

      t.timestamps
    end
  end
end
