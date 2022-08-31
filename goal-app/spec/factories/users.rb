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
FactoryBot.define do
  factory :user do
    username { Faker::Games::SuperSmashBros.fighter }
    password { 'password' }

    factory :user1 do
      username { 'user1' }
      password { '123456'}
    end
  end

end
