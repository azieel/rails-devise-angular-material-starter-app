class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|

        t.string :first_name
        t.string :last_name
        t.string :address
        t.integer :zip_code
        t.string :city
        t.string :country
        t.integer :tel

      t.timestamps
    end
  end
end
