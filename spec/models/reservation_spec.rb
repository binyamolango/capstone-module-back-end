require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    it 'should be valid with valid credentials' do
      user = User.create!(name: 'Binyam') # Using create! to persist and raise errors if any
      doctor = Doctor.create!(name: 'Doc 1', doctor_type: 'Doc type', image_url: 'ios.jpg', address: 'first street 123') # Same here
      reservation = Reservation.new(date_of_reservation: '1/2/2024', user: user, doctor: doctor)
    
      expect(reservation).to be_valid
    end

    it 'is not valid without an Reservation time' do
      Reservation = Reservation.new(date_of_reservation: nil)
      expect(Reservation).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'should belong to a doctor' do
      association = described_class.reflect_on_association(:doctor)
      expect(association.macro).to eq :belongs_to
    end
  end
end
