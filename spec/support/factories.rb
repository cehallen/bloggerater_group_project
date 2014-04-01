FactoryGirl.define do

  factory :user do
    email "abc@example.com"
    password "adminqwerty"
  end

  factory :review do
    comment "hi I love all da blurgz"
  end

end
