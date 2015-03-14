class AdminsController < ApplicationController
    before_action :authenticate_user!

    respond_to :json
    respond_to :html, only: []
    respond_to :xml, only: []

    def show
        @admin = Admin.find(params[:id])
        render json: @admin
    end

    def update
        @admin = Admin.find(params[:id])
        @admin.update_attributes(admin_params)

        render json: @admin
    end

    def default_serializer_options
      {root: false}
    end

    def admin_params
        params.permit(:first_name, :last_name, :address, :zip_code, :city, :tel, users_attributes: [:email, :password])
    end
end