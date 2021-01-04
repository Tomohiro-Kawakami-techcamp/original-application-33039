FactoryBot.define do
  factory :item do
    name {"Item"}
    info {Faker::Lorem.sentence}
    price { 15000 }
    price_discrimination { 12000 }
    category_id { 1 }
    delivery_id { 1 }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end