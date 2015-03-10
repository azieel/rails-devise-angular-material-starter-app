class CreateCompagnies < ActiveRecord::Migration
  def change
    create_table :compagnies do |t|

        t.string :name
        t.string :siret
        t.string :address

      t.timestamps
    end
  end
end
