class Measurment < ApplicationRecord
  has_many :results, dependent: :destroy
  validates :category, presence: true
end
