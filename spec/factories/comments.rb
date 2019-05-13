FactoryBot.define do
  factory :comment do
    comment {'こんにちは'}
    user
    post
  end
end
