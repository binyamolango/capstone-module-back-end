class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :user, presence: true
  validates :doctor, presence: true
  validates :date_of_reservation, presence: true
end
