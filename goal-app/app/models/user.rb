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
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      return user
    else
      return nil
    end
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end

  def reset_session_token!
    self.session_token = generate_unique_session_token
    self.save!
    self.session_token
  end

  def generate_unique_session_token
    token = SecureRandom::urlsafe_base64
    while User.find_by(session_token: token)
      token = SecureRandom::urlsafe_base64
    end
    token
  end

end
