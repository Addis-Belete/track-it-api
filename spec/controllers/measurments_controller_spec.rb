require 'rails_helper'

RSpec.describe 'Measurments API', type: :request do
  let!(:measurments) { create_list(:measurment, 10) }
  let(:measurment_id) { measurments.first.id }
  describe 'GET /measurments' do
    before { get '/measurments' }
    it 'returns measurments' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(@response).to have_http_status(:success)
    end
  end
  describe 'GET /measurments/:id' do
    before { get "/measurments/#{measurment_id}" }
    context 'when the record exists' do
      it 'returns the measurment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(measurment_id)
      end
    end
    context 'when the record does not exist ' do
      let(:measurment_id) { 100 }

      it 'returns a not found message' do
        expect(@response.body).to match(/Couldn't find Measurment/)
      end
    end
  end
  # test suite for POST /measurments
  describe 'POST /measurments' do
    let(:valid_attributes) { { category: 'biceps' } }
    context 'when the request is valid' do
      before { post '/measurments', params: valid_attributes }
      it 'creates a measurment category' do
        expect(json['category']).to eq('biceps')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid ' do
      before { post '/measurments', params: { category: '' } }
      it ' returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
  # test suite for PUT method
  describe 'PUT /measurments/:id' do
    let(:valid_attributes) { { category: 'Hips' } }
    context 'when the record exists' do
      before { put "/measurments/#{measurment_id}", params: valid_attributes }
      it 'updates the record' do
        expect(@response.body).to be_empty
      end
    end
  end
  # Test suite for DELETE
  describe 'DELETE /measurmens/:id' do
    before { delete "/measurments/#{measurment_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
