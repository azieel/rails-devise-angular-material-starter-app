class DeviseOverrides::PasswordsController < Devise::SessionsController

  respond_to :json
  respond_to :html, only: []
  respond_to :xml, only: []

end