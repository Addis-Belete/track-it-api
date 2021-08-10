require "rails_helper"

RSpec.describe Measurment, type: :model do
  it { should have_many(:results).dependent(:destroy) }
  it { should validate_presence_of(:category) }
end
