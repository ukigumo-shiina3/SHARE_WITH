FactoryBot.define do
    factory :event do
        title { Faker::Lorem.characters(number:30) }
        body { Faker::Lorem.characters(number: 500) }
        recruitment { Faker::Lorem.characters(number:100) }
    end
    factory :events do
        MAX_EVENTS_COUNT { Faker::Lorem.counts(number:3)}
    end
end