class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    respond_to :html, :json
    protect_from_forgery with: :exception

    def index
    end
end
