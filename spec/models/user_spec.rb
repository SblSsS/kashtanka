require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'attributes' do
  	it 'has first_name' do
  		expect(subject).to respond_to(:first_name)
  	end

  	it 'has last_name' do
  		expect(subject).to respond_to(:last_name)
  	end

  	it 'has email' do
  		expect(subject).to respond_to(:email)
  	end

  	it 'has phone' do
  		expect(subject).to respond_to(:phone)
  	end
  end

  describe 'associations' do
  	it 'has many roles' do
  		expect(subject).to respond_to(:roles)
  	end
  end

  describe 'validations' do
  	it 'has valid factory' do
  		expect(FactoryGirl.build(:user)).to be_valid
  	end

  	it 'has invalid factory' do
  		expect(FactoryGirl.build(:invalid_user)).not_to be_valid
  	end

  	it 'is invalid without first_name' do
  		expect(FactoryGirl.build(:user, first_name: nil)).not_to be_valid
  	end  	

  	it 'is invalid without last_name' do
  		expect(FactoryGirl.build(:user, last_name: nil)).not_to be_valid
  	end

  	it 'is invalid with first_name or last_name longer than 25' do
  		long_name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
  		expect(FactoryGirl.build(:user, first_name: long_name)).not_to be_valid
  		expect(FactoryGirl.build(:user, last_name: long_name)).not_to be_valid
  	end

  	it 'invalid with not numeric phone number' do
  		expect(FactoryGirl.build(:user, phone: 'dsds')).not_to be_valid
  	end
  end

  describe 'methods' do

  	let(:user) { FactoryGirl.create(:user) }

  	it 'has a full name' do
  		expect(user.name).to eql("#{user.first_name} #{user.last_name}")
  	end
  end
end
