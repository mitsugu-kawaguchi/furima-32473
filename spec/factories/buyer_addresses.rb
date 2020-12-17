FactoryBot.define do
  factory :buyer_address do
    post_code      { '123-4567' }
    city           { '八尾市' }
    address        { '太田' }
    phone_number   { '12345678910' }
    building_name  { 'プレサンス' }
    prefecture_id  { 2 }
    token          { 'tok_abcdefghijk00000000000000000' }
    user_id        {1}
    item_id        {1}
  end
end
