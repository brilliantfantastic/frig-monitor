# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "zen_spider"
    email "rdavis@example.com"
    password "popsicle"
  end
end
