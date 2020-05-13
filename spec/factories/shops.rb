FactoryBot.define do
  factory :shop do
    user_id { 1 }
    genre_id { 1 }
    shop_name { "かとう" }
    inquiry { "000" }
    address { "tokyo" }
  end
end
