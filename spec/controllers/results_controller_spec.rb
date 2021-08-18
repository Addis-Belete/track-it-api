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
  end
end
