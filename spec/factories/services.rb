FactoryBot.define do
  factory :service do
    content {"サービス"}
    limit_day {"2021-02-05"}
    target { "全会員" }
    release_day { "2021-02-05" }
    association :user
  end
end
