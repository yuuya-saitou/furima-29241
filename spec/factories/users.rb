FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"aaa@bbb"}
    password              {"000aaa"}
    password_confirmation {password}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"1994-05-14"}
  end
end