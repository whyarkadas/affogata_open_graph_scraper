require 'rails_helper'

RSpec.describe 'OpenGraphEntities', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:open_graph_test_entity) { FactoryBot.create(:open_graph_entity) }

      before do
        post '/api/v1/open_graph_entities', params:
          {
            url: "https://www.haberturk.com/"
          }
      end

      it 'returns the title' do
        expect(JSON.parse(response.body)['status']).to eq("SUCCESS")
      end

      it 'returns the content' do
        expect(JSON.parse(response.body)['message']).to eq("Open graph entity fetched successfully")
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/open_graph_entities', params:
          {
            url: ""
          }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end