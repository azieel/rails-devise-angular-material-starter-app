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
        params[:user_attributes] = eval(params[:user_attributes].gsub(':', '=>'))
        if params[:user_attributes]['password'] == params[:user_attributes]['password_confirmation']
            @admin = Admin.find(params[:id])
            if @admin.update_attributes!(admin_params)
                render json: @admin
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

    def admin_params
        params.permit(:first_name, :last_name, :address, :zip_code, :city, :tel, :user_attributes => [:id, :email, :password])
    end
end