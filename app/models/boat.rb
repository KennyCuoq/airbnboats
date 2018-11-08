class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :type, :description, :location, :daily_price, :capacity, :crew_number, :photo, presence: true
end
