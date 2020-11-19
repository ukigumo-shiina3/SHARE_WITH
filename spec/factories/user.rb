FactoryBot.define do
    factory :user do
        name { Faker::Lorem.characters(number:30) }
        email { Faker::Internet.email }
        introduction { Faker::Lorem.characters(number:200) }
        password { 'password' }
        password_confirmation { 'password' }
    end
end