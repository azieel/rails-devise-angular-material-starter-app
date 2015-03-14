class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|

        t.string :first_name
        t.string :last_name
        t.string :address
        t.integer :zip_code
        t.string :city
        t.string :country
        t.string :tel

        t.belongs_to :compagny, index:true        

        t.timestamps
    end
  end
end
