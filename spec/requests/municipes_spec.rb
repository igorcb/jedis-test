require 'rails_helper'

RSpec.describe 'Municipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/municipes'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get new_municipe_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET edit' do
    it 'returns http success' do
      municipe = create(:municipe)
      get edit_municipe_path(municipe.id)
      expect(response).to have_http_status(:success)
    end
  end
end