# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true



  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user && user.password == password
      return user
    else
      return nil
    end
  end
end
