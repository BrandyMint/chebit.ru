# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :discourse_rating do
      user_id 1
      discourse_id 1
      rate 1
    end
end