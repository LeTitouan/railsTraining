class User < ApplicationRecord

  validates :username,            presence: true, length: {maximum: 50}, uniqueness: true, format: { with: /[a-zA-Z]/ }
  validates :email,               presence: true
  validates :encrypted_password,  presence: true

end
