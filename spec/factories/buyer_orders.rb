FactoryBot.define do
  factory :buyer_order do
    postal_code   {"111-2222"}
    prefecture_id {11}
    municipality  {"大阪市阿倍野区"}
    address       {"1-2-3"}
    building_name {"ハイツhoge太郎"}
    phone_number  {"00011112222"}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
