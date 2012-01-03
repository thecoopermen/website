FactoryGirl.define do

  factory :post do
    sequence(:title) { |n| "A story about #{n}" }
    subtitle         "Just a placeholder subtitle"
    content          "Lorem ipsum..."
    association      :author
  end

  factory :author do
    sequence(:name) { |n| "An author named #{n}" }
    twitter         "@mcdonalds"
    bio             "Some Bio"
  end
end
