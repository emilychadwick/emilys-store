FactoryGirl.define do

  sequence(:email) {|n| "user#{n}@example.com"}

  factory :user do
    email
    password 'password'
    first_name 'Joe'
    last_name 'Schmoe'
    admin false
  end
end
