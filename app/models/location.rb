class Location < ApplicationRecord
  belongs_to :user
  has_many :bookings
  TYPE = ['Studio', 'Flat', 'Warehouse', 'Theatre', 'Boat', 'Outdoor', 'Factory']

  validates :name, :address, :description, :daily_fee, :style, presence: true
  validates :style, presence: true, inclusion: { in: TYPE }

end
