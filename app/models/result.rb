class Result < ApplicationRecord
  belongs_to :measurment
  validates :result, :measurment_id, presence: true
end
