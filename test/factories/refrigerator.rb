# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :frig, class: 'Refrigerator' do
    brand "GE"
    user
  end
end
