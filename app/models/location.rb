class Location < ApplicationRecord
  belongs_to :user
  TYPE = ['Studio', 'Flat', 'Warehouse', 'Theatre', 'Boat', 'Outdoor', 'Factory']

  validates :name, :address, :description, :daily_fee, :type, presence: true
  validates :type, presence: true, inclusion: { in: TYPE }


end
