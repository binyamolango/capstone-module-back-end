require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of all reservations' do
      user = User.create(name: 'example_user')
      doctor1 = Doctor.create(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: 'Cardiology',
                              address: '123 Main St')
      doctor2 = Doctor.create(name: 'Dr. Smith2', image_url: 'some_image.jpg', doctor_type: 'Cardiology',
                              address: '123 Main St')
      Reservation.create(user:, doctor: doctor1, date_of_reservation: '12/4/2024')
      Reservation.create(user:, doctor: doctor2, date_of_reservation: '12/4/2024')
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).count).to eq(2)
    end
  end

  describe 'GET #show' do
    it 'returns the details of a specific Reservation' do
      user = User.create(name: 'example_user')
      doctor = Doctor.create(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: 'Cardiology',
                             address: '123 Main St')
      reservation = Reservation.create(user:, doctor:, date_of_reservation: '12/4/2024')
      get :show, params: { id: reservation.id }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(reservation.id)
    end
  end
end
