require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    Role.create(name: 'Пользователь', code: :default)
  end

  let(:user) { User.new(name: FFaker::Internet.user_name, email: FFaker::Internet.safe_email) }
  let(:user_short_name) { User.new(name: 'a', email: FFaker::Internet.safe_email) }
  let(:user_long_name) { User.new(name: 'a' * 30, email: FFaker::Internet.safe_email) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid with a too short name' do
    expect(user_short_name).to_not be_valid
  end

  it 'is not valid with a too long name' do
    expect(user_long_name).to_not be_valid
  end
end
