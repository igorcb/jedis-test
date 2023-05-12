FactoryBot.define do
  factory :address do
    municipe
    zip_code { 'MyString' }
    street { 'MyString' }
    number { 'MyString' }
    complement { 'MyString' }
    neighborhood { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    code_ibge { 'MyString' }
  end
end
