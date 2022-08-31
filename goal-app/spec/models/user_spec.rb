# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  username      :string           not null
#  password      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  session_token :string           not null
#
require 'rails_helper'

RSpec.describe User, type: :model do


  before :each do
    create(:user)
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password) }


  describe 'User::find_by_credentials' do
    let(:valid_user) {
      User.create(username: 'user1',
      password: '123456')
    }


    context 'with valid credentials' do
      it 'should return the correct user instance' do
        user1 = User.create(username: 'user1', password: '123456')
        user = User.find_by_credentials('user1', '123456')
        expect(user).to eq(user1)
      end
    end

    context 'with non-existent username' do
      it 'should return nil' do
        user = User.find_by_credentials('user100', '12366576457')
        expect(user).to be(nil)
      end
    end

    context 'with wrong password' do
      it 'should return nil' do

        user = User.find_by_credentials('user1', '12366576457')
        expect(user).to be(nil)
      end
    end
  end
end
