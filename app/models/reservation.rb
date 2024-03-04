class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :date_of_reservation, presence: true
end
