FactoryGirl.define do
  factory :asset do
  	attachment { File.open(File.join(Rails.root,'spec/factories/dummy.jpg')) }
  end
end