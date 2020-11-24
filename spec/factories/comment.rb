FactoryBot.define do
    factory :comment do
        comment { Faker::Lorem.characters(number:500) }
    end
end