require "rails_helper"

RSpec.describe "Measurments API", type: :request do
  let!(:measurments) { create_list(:measurment, 10) }
  let(:measurment_id) { measurments.first.id }
  describe "GET /measurments" do
    before { get "/measurments" }
    it "returns measurments" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it "returns status code 200" do
      expect(@response).to have_http_status(:success)
    end
  end
  describe "GET /measurments/:id" do
    before { get "/measurments/#{measurment_id}" }
    context "when the record exists" do
      it "returns the measurment" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(measurment_id)
      end
    end
    context "when the record does not exist " do
      let (:measurment_id) { 100 }

      it "returns a not found message" do
        expect(@response.body).to match(/Couldn't find Measurment/)
      end
    end
  end
end
