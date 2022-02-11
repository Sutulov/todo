require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    Role.create(name: 'Пользователь', code: :default)
  end

  context 'is valid' do
    let(:user) { FactoryBot.create :user }

    it 'with valid attributes' do
      expect(user).to be_valid
    end
  end

  context 'is not valid' do
    let(:user_short_name) { FactoryBot.build :user, name: 'a' }
    let(:user_long_name) { FactoryBot.build :user, name: 'a' * 30 }

    it 'with a too short name' do
      expect(user_short_name).to_not be_valid
    end

    it 'with a too long name' do
      expect(user_long_name).to_not be_valid
    end
  end
end
