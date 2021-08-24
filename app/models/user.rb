class User < ApplicationRecord
  has_secure_password
  has_many :measurments, foreign_key: :user_id
  validate :name, :email, :password_digest, presence: true
end
