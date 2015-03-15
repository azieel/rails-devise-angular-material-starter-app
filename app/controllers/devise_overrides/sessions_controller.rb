class DeviseOverrides::SessionsController < Devise::SessionsController
    respond_to :json
end
