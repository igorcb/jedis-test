FactoryBot.define do
  path = Rails.root.join('spec/factories/images/avatar.jpg')
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::CPF.numeric }
    cns { '0000' }
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

# factory :culture do
#   name 'Soy'
#   after(:build) do |culture|
#     culture.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'soy.jpeg')), filename: 'soy.jpeg', content_type: 'image/jpeg')
#   end
# end