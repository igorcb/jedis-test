require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:municipe) { create(:municipe) }
  let(:address) {
    described_class.new(
      zip_code: '60742300',
      street: 'Rua Tenente Marcos Lira',
      number: 's/n',
      complement: '',
      neighborhood: 'Serrinha',
      city: 'Fortaleza',
      state: 'CE',
      code_ibge: '2304400',
      municipe:,
    )
  }

  let(:address_invalid) {
    described_class.new(
      zip_code: '60742300',
      street: 'Rua Tenente Marcos Lira',
      number: 's/n',
      complement: '',
      neighborhood: 'Serrinha',
      city: 'Fortaleza',
      state: 'CE',
      code_ibge: '2304400',
      municipe:,
    )
  }

  it { is_expected.to respond_to(:zip_code) }
  it { is_expected.to respond_to(:street) }
  it { is_expected.to respond_to(:number) }
  it { is_expected.to respond_to(:complement) }
  it { is_expected.to respond_to(:neighborhood) }
  it { is_expected.to respond_to(:city) }
  it { is_expected.to respond_to(:state) }
  it { is_expected.to respond_to(:code_ibge) }
  it { is_expected.to respond_to(:municipe) }

  it 'is valid' do
    expect(address).to be_valid
  end

  it 'when zip_code is not present' do
    address_invalid.zip_code = nil
    expect(address_invalid).not_to be_valid
  end

  it 'when street is not present' do
    address_invalid.street = nil
    expect(address_invalid).not_to be_valid
  end

  it 'when number is not present' do
    address_invalid.number = nil
    expect(address_invalid).not_to be_valid
  end

  it 'when neighborhood is not present' do
    address_invalid.neighborhood = nil
    expect(address_invalid).not_to be_valid
  end

  it 'when city is not present' do
    address_invalid.city = nil
    expect(address_invalid).not_to be_valid
  end

  it 'when state is not present' do
    address_invalid.state = nil
    expect(address_invalid).not_to be_valid
  end
end
