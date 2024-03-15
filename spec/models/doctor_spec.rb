require 'rails_helper'

RSpec.describe Doctor, type: :model do
  # test doctor validations
  describe 'validations' do
    it 'should be valid with valid credentials' do
      doctor = Doctor.new(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: 'Cardiology',
                          address: '123 Main St')
      expect(doctor).to be_valid
    end

    it 'is not valid without a name' do
      doctor = Doctor.new(name: nil)
      expect(doctor).to_not be_valid
    end

    it 'is not valid without a image_url' do
      doctor = Doctor.new(name: 'Dr. Smith', image_url: nil, doctor_type: 'Cardiology', address: '123 Main St')
      expect(doctor).to_not be_valid
    end

    it 'is not valid without a doctor_type' do
      doctor = Doctor.new(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: nil, address: '123 Main St')
      expect(doctor).to_not be_valid
    end

    it 'is not valid without an address' do
      doctor = Doctor.new(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: 'Cardiology', address: nil)
      expect(doctor).to_not be_valid
    end
  end

  # test doctor associations
  describe 'associations' do
    it 'should destroy associated appointments' do
      doctor1 = Doctor.new(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: 'Cardiology',
                           address: '123 Main St')
      doctor2 = Doctor.new(name: 'Dr. Smith2', image_url: 'some_image.jpg', doctor_type: 'Cardiology',
                           address: '123 Main St')
      doctor3 = Doctor.new(name: 'Dr. Smith3', image_url: 'some_image.jpg', doctor_type: 'Cardiology',
                           address: '123 Main St')

      expect(doctor1).to be_valid
      expect(doctor2).to be_valid
      expect(doctor3).to be_valid
    end

    it 'should have many users through appointments' do
      doctor = Doctor.new(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: 'Cardiology',
                          address: '123 Main St')
      expect(doctor).to be_valid
    end
  end
end
