FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "abc_#{n}@example.com" }
    password "adminqwerty"
  end

  factory :review do
    comment "hi I love all da blurgz"
    association :reviewer, factory: :user
    association :blog, factory: :blog
  end  

  factory :blog do
    title "Moderation Pays Off for a Far-Right Party in France"
    sequence(:url) { |i| "http://www.nytimes#{i}.com/2014/04/02/world/europe/moderation-pays-off-for-a-far-right-party-in-france.html?hp&_r=0"}
    association :user, factory: :user
  end

  factory :rating do
    blog_rating 3
    association :blog, factory: :blog
  end

end
