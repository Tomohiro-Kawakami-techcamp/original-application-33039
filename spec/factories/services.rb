FactoryBot.define do
  factory :service do
    content {"サービス"}
    limit_day {"1/1"}
    target { "全会員" }
    release_day { "2/2" }
    association :user
  end
end
