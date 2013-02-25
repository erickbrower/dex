FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@email.com" }
    password '12345678'
    password_confirmation '12345678'
  end

  factory :token do
    sequence(:value) { |n| "1234567890#{n}" }
    is_active true
    user
  end
end
