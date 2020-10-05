FactoryBot.define do
  factory :item do

    id               {1}
    name             {"hoge"}
    explanation      {"hogehoge"}
    category_id      {2}
    status_id        {2}
    delivery_fee_id  {2}
    shipping_area_id {2}
    shipping_days_id {2}
    price            {1000}
    created_at       {"2020-01-01"}
    updated_at       {"2020-01-01"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end