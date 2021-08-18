require "rails_helper"

RSpec.describe "Results API", type: :request do
  let!(:measurment) { create(:measurment) }
  let!(:results) { create_list(:result, 20, measurment_id: measurment.id) }
  let(:measurment_id) { measurment.id }
  let(:id) { results.first.id }

  # test suite for GET

  describe "GET  /measurments/:id/results" do
    before { get "/measurments/#{measurment_id}/results" }
    context "when result exists" do
      it "returns all measured results" do
        expect(json.size).to eq(20)
      end
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when todo does not exist" do
      let(:measurment_id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Measurment/)
      end
    end
  end
end
