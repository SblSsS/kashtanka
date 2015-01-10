require 'rails_helper'

RSpec.describe Language, :type => :model do
  
	let(:english) { FactoryGirl.create(:language) }
	let(:spanish) { FactoryGirl.create(:language_spanish) }

	describe 'attributes' do

		it 'has name' do
			expect(subject).to respond_to(:name) 
		end

		it 'has iso' do
			expect(subject).to respond_to(:iso) 
		end

		it 'has published' do
			expect(subject).to respond_to(:published) 
		end

	end

	describe 'validations' do

		it 'has valid factory' do
			expect(FactoryGirl.build(:language)).to be_valid
		end

		it 'is not valid without name' do
			expect(FactoryGirl.build(:language, name: nil)).not_to be_valid
		end

		it 'is not valid without iso' do
			expect(FactoryGirl.build(:language, iso: nil)).not_to be_valid
		end

	end

	describe 'methods' do

		it 'can not be destroyed if en' do
			english.destroy
			expect(Language.find_by(iso: english.iso)).not_to be_nil
		end

		it 'can be destroyed if not en' do
			spanish.destroy
			expect(Language.find_by(iso: spanish.iso)).to be_nil
		end

	end

end
