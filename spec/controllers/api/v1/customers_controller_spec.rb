require 'rails_helper'

describe Api::V1::CustomersController do

  describe 'GET #show' do
    it 'assigns the requested Customer to @Customer' do
      sign_in
      customer = FactoryGirl.create(:customer)
      get :show, id: customer
      expect(assigns(:customer)).to eq(customer)
    end
    it 'raise an exception when customer is an invalid record' do
      sign_in
      expect{FactoryGirl.create(:invalid_admin)}.to raise_exception(ActiveRecord::RecordInvalid)
    end
    it 'raise an exception when customer is not in database' do
      sign_in
      expect{Customer.find(5)}.to raise_exception(ActiveRecord::RecordNotFound)
    end
    it 'render success status when user is authenticated and customer hash is valid' do
      sign_in
      customer = FactoryGirl.create(:customer)
      get :show, id: customer
      expect(response).to have_http_status(:success)
    end
    it 'render 401 status when user not authenticated and customer hash is valid' do
      sign_in = nil
      customer = FactoryGirl.create(:customer)
      get :show, id: customer
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT #update' do
    it "saves the new customer attributes in the database and return success response" do
      sign_in
      customer = FactoryGirl.create :customer
      user_attributes = "{ 'id': '" + customer.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + customer.user.role_type.to_s + "' ,'role_id': '" + customer.user.role_id.to_s + "' }"
      params = {
        id: customer.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: customer.address, 
        zip_code: customer.zip_code,
        city: customer.city,
        user_attributes: user_attributes
      }
      put :update,  params
      expect(response).to have_http_status(:success)
    end
    it "return a Json response" do
      sign_in
      customer = FactoryGirl.create :customer
      user_attributes = "{ 'id': '" + customer.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + customer.user.role_type.to_s + "' ,'role_id': '" + customer.user.role_id.to_s + "' }"
      params = {
        id: customer.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: customer.address, 
        zip_code: customer.zip_code,
        city: customer.city,
        user_attributes: user_attributes
      }
      put :update,  params
      customer.reload
      expect(response.header['Content-Type']).to include('application/json')
    end
    it "render with updated customer attributes" do
      sign_in
      customer = FactoryGirl.create :customer
      user_attributes = "{ 'id': '" + customer.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + customer.user.role_type.to_s + "' ,'role_id': '" + customer.user.role_id.to_s + "' }"
      params = {
        id: customer.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: customer.address, 
        zip_code: customer.zip_code,
        city: customer.city,
        user_attributes: user_attributes
      }
      put :update,  params
      customer.reload
      expect(customer.first_name).to eq(params[:first_name])
    end
    it "render json with updated user attributes" do
      sign_in
      customer = FactoryGirl.create :customer
      user_attributes = "{ 'id': '" + customer.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + customer.user.role_type.to_s + "' ,'role_id': '" + customer.user.role_id.to_s + "' }"
      params = {
        id: customer.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: customer.address, 
        zip_code: customer.zip_code,
        city: customer.city,
        user_attributes: user_attributes
      }
      put :update,  params
      customer.reload
      expect(customer.user.email).to eq("new_email@mail.com")
    end
    it "update password if password and password_confirmation are the same and valid" do
      sign_in
      customer = FactoryGirl.create :customer
      user_attributes = "{ 'id': '" + customer.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + customer.user.role_type.to_s + "' ,'role_id': '" + customer.user.role_id.to_s + "', 'password': '123456789', 'password_confirmation': '123456789'  }"
      params = {
        id: customer.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: customer.address, 
        zip_code: customer.zip_code,
        city: customer.city,
        user_attributes: user_attributes
      }
      put :update,  params
      expect(response).to have_http_status(:success)
    end
    it "return error status if password and password_confirmation not the same" do
      sign_in
      customer = FactoryGirl.create :customer
      user_attributes = "{ 'id': '" + customer.user.id.to_s + "','email': 'new_email@mail.com','role_type': '" + customer.user.role_type.to_s + "' ,'role_id': '" + customer.user.role_id.to_s + "', 'password': '123456789', 'password_confirmation': '52225465225'  }"
      params = {
        id: customer.id, 
        first_name: "John", 
        last_name: "Doe", 
        tel: "0405020302", 
        address: customer.address, 
        zip_code: customer.zip_code,
        city: customer.city,
        user_attributes: user_attributes
      }
      put :update,  params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
