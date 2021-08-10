class Result < ApplicationRecord
  belongs_to :measurment
  validates_presence_of :result
end
