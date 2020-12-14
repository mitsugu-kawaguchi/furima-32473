FactoryBot.define do
  factory :item do
    name                       { 'yasai' }
    price                      { 300 }
    description                { 'aaa' }
    category_id                { 2 }
    status_id                  { 2 }
    shipping_cost_id           { 2 }
    prefecture_id              { 2 }
    shipping_days_id           { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
