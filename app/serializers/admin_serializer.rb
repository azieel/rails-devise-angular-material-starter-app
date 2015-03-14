class AdminSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :address, :zip_code, :city, :country, :tel, :user

  def username
    object.username
  end

  def user
    object.user
  end

end
