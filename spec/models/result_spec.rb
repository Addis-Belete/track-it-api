require "rails_helper"

RSpec.describe Result, type: :model do
  it { should belong_to(:measurment) }
  it { should validate_presence_of(:result) }
end
