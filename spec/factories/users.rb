FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {"hoge12"}
    password_confirmation {password}
    name { "山田太郎" }
    name_kana {"ヤマダタロウ"}
    member_id {1}
  end
end