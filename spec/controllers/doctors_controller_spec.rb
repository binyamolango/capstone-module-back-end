require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of all doctors' do
      doctor1 = Doctor.create(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: 'Cardiology', address: '123 Main St')
      doctor2 = Doctor.create(name: 'Dr. Smith2', image_url: 'some_image.jpg', doctor_type: 'Cardiology', address: '123 Main St')
      doctor3 = Doctor.create(name: 'Dr. Smith3', image_url: 'some_image.jpg', doctor_type: 'Cardiology', address: '123 Main St')
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).count).to eq(6)
    end
  end

  describe 'GET #show' do
    it 'returns the details of a specific doctor' do
      doctor = Doctor.create(name: 'Dr. Smith', image_url: 'some_image.jpg', doctor_type: 'Cardiology', address: '123 Main St')
      get :show, params: { id: doctor.id }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(doctor.id)
    end
  end
end