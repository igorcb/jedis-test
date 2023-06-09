FactoryBot.define do
  path = Rails.root.join('spec/factories/images/avatar.jpg')
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::CPF.numeric }
    cns { '187329617340002' }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    birth_date { Time.zone.today - 20.years }
    after(:build) do |municipe|
      municipe.image.attach(
        io: File.open(path),
        filename: 'avatar.jpg',
        content_type: 'image/jpg',
      )
    end
  end
end