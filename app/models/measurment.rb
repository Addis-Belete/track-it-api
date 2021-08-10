class Measurment < ApplicationRecord
  has_many :results, dependent: :destroy
  validates_presence_of :category
end
