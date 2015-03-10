class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable

    belongs_to :role, polymorphic: true, dependent: :destroy

    ROLES = %w(admin customer)


    ROLES.each { |role| 
        define_method("is_#{role}?") { role_type == role.classify }
    }
end
