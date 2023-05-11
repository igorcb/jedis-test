FactoryBot.define do
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::CPF.numeric }
    cns { '0000' }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    birth_date { Time.zone.today - 20.years }
  end
end
