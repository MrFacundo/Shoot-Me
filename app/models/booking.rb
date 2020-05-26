class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :location
  STATUS = ['Pending', 'Accepted', 'Denied']
  validates :start_date, :end_date, presence:true
  # validates :status, presence: true, inclusion: { in: STATUS }
  # method needs to be added when we have owner 
end
