class AdminSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :address, :zip_code, :city, :country, :tel

  def username
    object.username
  end

end
