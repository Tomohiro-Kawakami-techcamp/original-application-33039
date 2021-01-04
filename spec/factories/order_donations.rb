FactoryBot.define do
  factory :order_donation do
    postal_code {"123-4567"}
    prefecture_id { 14 }
    city { "横浜市港北区" }
    address { "新横浜1-1-1" }
    building { "柳ビル103"}
    phone_number { "09012345678" }
    user_id {1}
    item_id {1}
  end
end