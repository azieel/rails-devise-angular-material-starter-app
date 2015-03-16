class Admin < ActiveRecord::Base
    has_one :user, as: :role

    accepts_nested_attributes_for :user

    validates :zip_code, numericality: true

    def username
        "#{self.first_name} #{self.last_name}"
    end

end
