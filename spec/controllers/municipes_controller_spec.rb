require 'rails_helper'

RSpec.describe MunicipesController, type: :controller do
  subject(:municipe) { create(:municipe) }

  let(:municipe_params) {
    {
      name: 'John Doe',
      cpf: Faker::CPF.numeric,
      cns: '111111111111111',
      email: 'john@Doe.com',
      phone: '1111111111',
      birth_date: Date.current - 30,
    }
  }

  it 'when params invalid return success' do
    post :create, params: { municipe: { name: nil } }

    expect(response).not_to be_successful
  end

  it 'when params valid return success' do
    post :create, params: { municipe: municipe_params }

    municipe_last = Municipe.last
    expect(municipe_last.name).to eq(municipe_params[:name])
    expect(municipe_last.cpf).to eq(municipe_params[:cpf])
    expect(municipe_last.cns).to eq(municipe_params[:cns])
    expect(municipe_last.email).to eq(municipe_params[:email])
    expect(municipe_last.birth_date).to eq(municipe_params[:birth_date])
    expect(municipe_last.phone).to eq(municipe_params[:phone])
    expect(response).to redirect_to(municipes_path)
  end

  it 'when edit params invalid return error' do
    put :update, params: { id: municipe.id, municipe: { name: nil } }

    expect(response).not_to be_successful
  end

  it 'when edit params valid return success' do
    name_update = Faker::Name.name
    put :update, params: { id: municipe.id, municipe: { name: name_update } }

    municipe_last = Municipe.last
    expect(municipe_last.name).to eq(name_update)
    expect(response).to redirect_to(municipes_path)
  end
end