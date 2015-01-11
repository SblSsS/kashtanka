FactoryGirl.define do
  factory :language do
  	name "English"
  	iso  "en"
  	published true

  	factory :language_russian do
  		name "Russian"
  		iso  "ru"
  	end

  	factory :language_spanish do
  		name "Spanish"
  		iso  "es"
  	end
  end
end
