class AddCoordinatesToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :latitude, :float
    add_column :boats, :longitude, :float
  end
end
