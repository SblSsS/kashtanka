require 'rails_helper'

RSpec.describe Role, :type => :model do
  describe 'attributes' do
  	it 'has name' do
  		expect(subject).to respond_to('name')
  	end
  end

  describe 'validations' do
  	it 'has a valid factory' do
  		role = FactoryGirl.build(:administrator)
  		expect(role).to be_valid
  	end

  	it 'has invalid factory' do
  		role = FactoryGirl.build(:invalid_role)
  		expect(role).not_to be_valid
  	end
  end
end
