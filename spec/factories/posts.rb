FactoryBot.define do
  factory :post do
    title { "title" }
    content { "content" }
    answer { "answer" }
    user
    category
  end
end
