require 'faker'

FactoryGirl.define do
  factory :user do
  	email Faker::Internet.email
  	first_name Faker::Name.first_name
  	last_name Faker::Name.last_name
  	password 'password'
  	password_confirmation 'password'

  	factory :user_vendor do
  		after(:create) { |user| user.roles << FactoryGirl.create(:vendor) }
  	end

  	factory :user_administrator do
  		after(:create) { |user| user.roles << FactoryGirl.create(:administrator) }
  	end

  end

  factory :invalid_user, :class => "User" do
  	email nil
  end
end
