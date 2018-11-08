class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.user :references
      t.boat :references
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :passenger_number
      t.integer :total_price

      t.timestamps
    end
  end
end
