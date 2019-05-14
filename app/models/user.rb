class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :lockable

  validates :username,                 presence: true, length: {maximum: 50}, uniqueness: true, format: { with: /[a-zA-Z]/ }
  validates :email,                    presence: true

end
