FactoryGirl.define do
  factory :role do
  	factory :customer do
  		name "customer"
  	end

  	factory :vendor do
  		name "vendor"
  	end

  	factory :administrator do
  		name "administrator"
  	end
  end

  factory :invalid_role, :class => "Role" do
  	name nil
  end
end
