require 'rails_helper'

RSpec.describe 'Results API', type: :request do
  let!(:measurment) { create(:measurment) }
  let!(:results) { create_list(:result, 20, measurment_id: measurment.id) }
  let(:measurment_id) { measurment.id }
  let(:id) { results.first.id }

  # test suite for GET

  describe 'GET  /measurments/:id/results' do
    before { get "/measurments/#{measurment_id}/results" }
    context 'when result exists' do
      it 'returns all measured results' do
        expect(json.size).to eq(20)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when todo does not exist' do
      let(:measurment_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Measurment/)
      end
    end
  end
  describe '/measurments/:measurment_id/results/:id' do
    before { get "/measurments/#{measurment_id}/results/#{id}" }

    context 'when measurment result exits exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the result' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when measurment result does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Result/)
      end
    end
  end
  # test suite for put
  describe 'POST /measurments/:measurment_id/results' do
    let(:valid_attributes) { { result: 1 } }

    context 'when request attributes are valid' do
      before { post "/measurments/#{measurment_id}/results", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      before { post "/measurments/#{measurment_id}/results", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Result can't be blank/)
      end
    end
  end
end
