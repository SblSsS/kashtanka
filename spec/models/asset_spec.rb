require 'rails_helper'

RSpec.describe Asset, :type => :model do

  describe "attributes" do
  	it 'has attachment'do
  		expect(subject).to respond_to(:attachment)
  	end

  	it 'has alt' do
  		expect(subject).to respond_to(:alt)
  	end

  	it 'has position' do
  		expect(subject).to respond_to(:position)
  	end

  	it 'has type' do
  		expect(subject).to respond_to(:type)
  	end

  	it 'has viewable_id' do
  		expect(subject).to respond_to(:viewable_id)
  	end

  	it 'has viewable_type' do
  		expect(subject).to respond_to(:viewable_type)
  	end
  end

  describe 'validations' do

  end

  describe 'methods' do

  end

end
