require 'rails_helper'

RSpec.describe User, type: :model do
  # test user validations
  describe 'validations' do
    it 'should be valid with valid credentials' do
      user = User.new(name: 'example_user')
      expect(user).to be_valid
    end

    it 'is not valid without a username' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it 'is valid with a number name' do
      user = User.new(name: 123)
      expect(user).to be_valid
    end
  end
end