require 'rails_helper'

RSpec.describe Admin::UsersController, :type => :controller do

	let(:admin) { FactoryGirl.create(:user_administrator) }
	
	before do
		allow(admin).to receive(:is_administrator?).and_return(true)
    sign_in(admin)
	end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end

    it "resources collection" do
      get 'index'
      expect(assigns(:users)).not_to be_nil
    end
  end

  describe "GET 'new'" do
    it 'returns new resource' do
      get :new
      expect(assigns(:user).id).to be_nil
    end
  end

  describe "GET 'edit'" do
    it 'returns resource' do
      get :edit, id: admin.id
      expect(assigns(:user)).to eql(admin)
    end
  end

end