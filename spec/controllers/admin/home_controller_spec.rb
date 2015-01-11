require 'rails_helper'

RSpec.describe Admin::HomeController, :type => :controller do

	let(:admin) { FactoryGirl.create(:user_administrator) }
	
	before do
		allow(admin).to receive(:is_administrator?).and_return(true)
	end

  describe "GET 'index'" do
    it "returns http success" do
    	sign_in(admin)
      get 'index'
      expect(response).to be_success
    end
  end

end
