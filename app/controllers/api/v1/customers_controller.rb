class Api::V1::CustomersController < ApplicationController
    before_action :authenticate_user!

    respond_to :json

    def show
        @customer = Customer.find(params[:id])
        render json: @customer
    end

    def update
        params[:user_attributes] = eval(params[:user_attributes].gsub(':', '=>'))
        if params[:user_attributes]['password'] == params[:user_attributes]['password_confirmation']
            @customer = Customer.find(params[:id])
            if @customer.update_attributes!(customer_params)
                render json: @customer
            else 
                render json: {error: "Error update profile"}, status: :bad_request
            end
        else
            render json: {error: "Error password change"}, status: :unprocessable_entity
        end
    end

    def default_serializer_options
      {root: false}
    end

    def customer_params
        params.permit(:first_name, :last_name, :address, :zip_code, :city, :tel, :user_attributes => [:id, :email, :password])
    end
end