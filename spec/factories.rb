FactoryGirl.define do

  factory :post do
    sequence(:title) { |n| "A story about #{n}" }
    subtitle         "Just a placeholder subtitle"
    content          "Lorem ipsum..."
    association      :author, :factory => :admin_user
  end

  factory :admin_user do
    sequence(:email)      { |n| "user#{n}@example.com" }
    sequence(:name)       { |n| "An author named #{n}" }
    password              "password"
    password_confirmation "password"
    twitter               "@mcdonalds"
    bio                   "Some Bio"
  end
end
