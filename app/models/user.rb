class User < ApplicationRecord
  has_many :measurments
  validates_presence_of :name, :email, :password
end
