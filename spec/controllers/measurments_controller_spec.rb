require "rails_helper"

RSpec.describe Measurments API, type: :request do
  let!(:measurments) { create_list(:measurment, 10) }
  let!(measurment_id) { measurments.first.id }
  describe "GET /measurments" do
    before { get "/measurments" }
    it "returns measurments" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
