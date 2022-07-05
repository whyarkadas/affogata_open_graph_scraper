require 'rails_helper'

RSpec.describe 'OpenGraphEntities', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:open_graph_entity, 10)
      get '/api/v1/open_graph_entities'
    end

    it 'returns all posts' do
      entities = JSON.parse(response.body)
      expect(entities["data"].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end