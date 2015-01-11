require 'faker'

FactoryGirl.define do
  factory :post do
  	title 		{ Faker::Lorem.word }
  	body  		{ Faker::Lorem.paragraph }
  	published true
  	user
  end
end
