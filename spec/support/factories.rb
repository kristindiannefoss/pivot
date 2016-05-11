FactoryGirl.define do
  factory :category do |n|
    sequence(:name) {|n| "name #{n}" }
  end

  factory :user do |n|
    sequence(:first_name) {|n| "firstname #{n}" }
    sequence(:last_name) {|n| "lastname #{n}" }
    sequence(:username) {|n| "username#{n}" }
    sequence(:email) {|n| "email#{n}@email.com" }
    sequence(:password) { "password" }
    sequence(:image_url) {|n| "image_#{n}.png"}
    sequence(:country) {|n| "country #{n}"}
    sequence(:city) {|n| "city #{n}"}
  end

  factory :need do |n|
    sequence(:name) {|n| "name #{n}" }
    sequence(:description) {|n| "description #{n}" }
    sequence(:cost) {|n| n }
    sequence(:raised) {|n| n }
    sequence(:image_url) {|n| "image_#{n}.png"}
  end
end
