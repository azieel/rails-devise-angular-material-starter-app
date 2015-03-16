require 'rails_helper'

describe Api::V1::AdminsController do

  describe 'GET #show' do
    it 'assigns the requested Admin to @Admin' do
      sign_in
      admin = FactoryGirl.create(:admin)
      get :show, id: admin
      expect(assigns(:admin)).to eq(admin)
    end
    it 'raise an exception when admin is an invalid record' do
      sign_in
      expect{FactoryGirl.create(:invalid_admin)}.to raise_exception(ActiveRecord::RecordInvalid)
    end
    it 'raise an exception when admin is not in database' do
      sign_in
      expect{Admin.find(5)}.to raise_exception(ActiveRecord::RecordNotFound)
    end
    it 'render success status when user is authenticated and admin hash is valid' do
      sign_in
      admin = FactoryGirl.create(:admin)
      get :show, id: admin
      expect(response).to have_http_status(:success)
    end
    it 'render 401 status when user not authenticated and admin hash is valid' do
      sign_in = nil
      admin = FactoryGirl.create(:admin)
      get :show, id: admin
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT #update' do
    it "saves the new admin attributes in the database and return success response" do
      sign_in
      admin = FactoryGirl.create :admin
      user_attributes = "{ 'id': '" + admin.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + admin.user.role_type.to_s + "' ,'role_id': '" + admin.user.role_id.to_s + "' }"
      params = {
        id: admin.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: admin.address, 
        zip_code: admin.zip_code,
        city: admin.city,
        user_attributes: user_attributes
      }
      put :update,  params
      expect(response).to have_http_status(:success)
    end
    it "return a Json response" do
      sign_in
      admin = FactoryGirl.create :admin
      user_attributes = "{ 'id': '" + admin.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + admin.user.role_type.to_s + "' ,'role_id': '" + admin.user.role_id.to_s + "' }"
      params = {
        id: admin.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: admin.address, 
        zip_code: admin.zip_code,
        city: admin.city,
        user_attributes: user_attributes
      }
      put :update,  params
      admin.reload
      expect(response.header['Content-Type']).to include('application/json')
    end
    it "render with updated admin attributes" do
      sign_in
      admin = FactoryGirl.create :admin
      user_attributes = "{ 'id': '" + admin.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + admin.user.role_type.to_s + "' ,'role_id': '" + admin.user.role_id.to_s + "' }"
      params = {
        id: admin.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: admin.address, 
        zip_code: admin.zip_code,
        city: admin.city,
        user_attributes: user_attributes
      }
      put :update,  params
      admin.reload
      expect(admin.first_name).to eq(params[:first_name])
    end
    it "render json with updated user attributes" do
      sign_in
      admin = FactoryGirl.create :admin
      user_attributes = "{ 'id': '" + admin.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + admin.user.role_type.to_s + "' ,'role_id': '" + admin.user.role_id.to_s + "' }"
      params = {
        id: admin.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: admin.address, 
        zip_code: admin.zip_code,
        city: admin.city,
        user_attributes: user_attributes
      }
      put :update,  params
      admin.reload
      expect(admin.user.email).to eq("new_email@mail.com")
    end
    it "update password if password and password_confirmation are the same and valid" do
      sign_in
      admin = FactoryGirl.create :admin
      user_attributes = "{ 'id': '" + admin.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + admin.user.role_type.to_s + "' ,'role_id': '" + admin.user.role_id.to_s + "', 'password': '123456789', 'password_confirmation': '123456789'  }"
      params = {
        id: admin.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: admin.address, 
        zip_code: admin.zip_code,
        city: admin.city,
        user_attributes: user_attributes
      }
      put :update,  params
      expect(response).to have_http_status(:success)
    end
    it "return error status if password and password_confirmation not the same" do
      sign_in
      admin = FactoryGirl.create :admin
      user_attributes = "{ 'id': '" + admin.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + admin.user.role_type.to_s + "' ,'role_id': '" + admin.user.role_id.to_s + "', 'password': '123456789', 'password_confirmation': '52225465225'  }"
      params = {
        id: admin.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: admin.address, 
        zip_code: admin.zip_code,
        city: admin.city,
        user_attributes: user_attributes
      }
      put :update,  params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
