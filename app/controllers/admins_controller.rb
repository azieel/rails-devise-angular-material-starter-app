class AdminsController < ApplicationController
    before_action :authenticate_user!

    respond_to :json
    respond_to :html, only: []
    respond_to :xml, only: []

    def show
        @admin = Admin.find(params[:id])
        render json: @admin
    end

    def default_serializer_options
      {root: false}
    end

end