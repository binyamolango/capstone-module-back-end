require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of all users' do
      user1 = User.create(name: 'Dr. Smith')
      user2 = User.create(name: 'Dr. Smith2')
      user3 = User.create(name: 'Dr. Smith3')
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).count).to eq(3)
    end
  end

  describe 'GET #show' do
    it 'returns the details of a specific user' do
      user = User.create(name: 'Dr. Smith')
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end
  end
end