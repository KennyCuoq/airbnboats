class Boat < ApplicationRecord
  belongs_to :user
  validates :name, :type, :description, :location, :daily_price, :capacity, :crew_number, :photo, presence: true
end
