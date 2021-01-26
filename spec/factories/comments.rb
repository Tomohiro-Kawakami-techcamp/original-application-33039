FactoryBot.define do
  factory :comment do
    message {"Item"}
    
    association :user
  end
end
