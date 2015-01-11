require 'rails_helper'

RSpec.describe Post, :type => :model do
	let(:post) { FactoryGirl.create(:post) }

	describe 'attributes' do

		it 'has title' do
			expect(subject).to respond_to(:title) 
		end

		it 'has body' do
			expect(subject).to respond_to(:body) 
		end

		it 'has published' do
			expect(subject).to respond_to(:published) 
		end

		it 'has user' do
			expect(subject).to respond_to(:user) 
		end

	end

	describe 'validations' do

		it 'has valid factory' do
			expect(FactoryGirl.build(:post)).to be_valid
		end

		it 'is not valid without title' do
			expect(FactoryGirl.build(:post, title: nil)).not_to be_valid
		end

		it 'is not valid without body' do
			expect(FactoryGirl.build(:post, body: nil)).not_to be_valid
		end

		it 'is not valid with existing title' do
			post1 = FactoryGirl.create(:post, title: "Bolt")
			expect(FactoryGirl.build(:post, title: "Bolt", user_id: post1.user_id)).not_to be_valid
		end

	end

	describe 'methods' do

	end
end
