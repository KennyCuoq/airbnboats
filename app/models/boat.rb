class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :boat_type, :description, :location, :daily_price, :capacity, :crew_number, :photo, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
