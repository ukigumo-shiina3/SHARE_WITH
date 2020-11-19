FactoryBot.define do
    factory :event do
        title { Faker::Lorem.characters(number:30) }
        body { Faker::Lorem.characters(number: 500) }
        recruitment { Faker::Lorem.characters(number:100) }
    end
end