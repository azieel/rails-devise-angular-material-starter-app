require 'rails_helper'

describe Api::V1::AdminsController do
  describe 'GET #show' do
    it 'assigns the requested Admin to @Admin' do
      sign_in
      admin = FactoryGirl.create(:admin)
      get :show, id: admin
      assigns(:admin).should eq(admin)
    end
    it 'render json with the admin hash' 
  end
  describe 'PUT #update' do
    context "with valid attributes" do 
      it "saves the new admin attributes in the database" 
      it "render json with updated admin" 
    end
  end
end