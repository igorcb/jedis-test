require 'rails_helper'
require 'byebug'
RSpec.describe Municipe, type: :model do
  let(:municipe) {
    described_class.new(
      name: 'John Doe',
      cpf: Faker::CPF.numeric,
      cns: '111111111111111',
      email: 'john@Doe.com',
      phone: '1111111111',
      birth_date: Time.zone.now,
    )
  }

  let(:municipe_invalid) {
    described_class.new(
      name: 'John Doe',
      cpf: Faker::CPF.numeric,
      cns: '111111111111111',
      email: 'john@Doe.com',
      phone: '1111111111',
      birth_date: Time.zone.now,
    )
  }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:cpf) }
  it { is_expected.to respond_to(:cns) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:phone) }
  it { is_expected.to respond_to(:birth_date) }

  it 'is valid' do
    expect(municipe).to be_valid
  end

  it 'when name is not present' do
    municipe_invalid.name = nil
    expect(municipe_invalid).not_to be_valid
  end

  it 'when cpf is not present' do
    municipe_invalid.cpf = nil
    expect(municipe_invalid).not_to be_valid
  end

  it 'when cns is not present' do
    municipe_invalid.cns = nil
    expect(municipe_invalid).not_to be_valid
  end

  it 'when phone is not present' do
    municipe_invalid.phone = nil
    expect(municipe_invalid).not_to be_valid
  end

  it 'when email is not present' do
    municipe_invalid.email = nil
    expect(municipe_invalid).not_to be_valid
  end

  it 'when birth_date is not present' do
    municipe_invalid.birth_date = nil
    expect { municipe_invalid.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'when birth_date is greater than the current date' do
    municipe_invalid.birth_date = Date.current + 1.year
    expect { municipe_invalid.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'when birth_date is greater than the current date 100 year' do
    municipe_invalid.birth_date = Date.current - 103.years
    expect { municipe_invalid.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'when birth_date is valid' do
    municipe_invalid.birth_date = Date.current - 10.years
    expect(municipe_invalid).to be_valid
  end

  it 'when image is attached' do
    path = Rails.root.join('spec/factories/images/avatar.jpg')
    municipe.image.attach(
      io: File.open(path),
      filename: 'avatar.jpg',
      content_type: 'image/jpg',
    )
    expect(municipe.image).to be_attached
  end
end