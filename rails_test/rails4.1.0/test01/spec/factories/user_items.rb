# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_item do
    user nil
    item nil
    number 1
  end
end
