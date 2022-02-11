require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_length_of(:name).is_at_most(25) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:email) }

  # validates :email, :name, presence: true
  # validates :email, :name, uniqueness: true
  # validates :name, length: { maximum: 25, minimum: 2 }

  # before :each do
  #   Role.create(name: 'Пользователь', code: :default)
  # end

  # context 'is valid' do
  #   let(:user) { FactoryBot.create :user }

  #   it 'with valid attributes' do
  #     expect(user).to be_valid
  #   end
  # end

  # context 'is not valid' do
  #   let(:user_short_name) { FactoryBot.build :user, name: 'a' }
  #   let(:user_long_name) { FactoryBot.build :user, name: 'a' * 30 }

  #   it 'with a too short name' do
  #     expect(user_short_name).to_not be_valid
  #   end

  #   it 'with a too long name' do
  #     expect(user_long_name).to_not be_valid
  #   end
  # end
end
