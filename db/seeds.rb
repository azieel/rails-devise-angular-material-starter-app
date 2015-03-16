# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

admin = User.create!(email: 'faure.julien5214@gmail.com', password: "52145214", password_confirmation: "52145214")
admin_role = Admin.create!(first_name: "Julien", last_name: "Faure", address: "14 rue des Grillons", zip_code: "13510", city: "Eguilles", country: "France", tel: "0442506087")
admin.role = admin_role
admin.save
p "ADMIN USER CREATED ============================================================"
p admin
p "==============================================================================="
customer = User.create!(email: 'customer@gmail.com', password: "52145214", password_confirmation: "52145214")
customer_role = Customer.create!(first_name: "John", last_name: "Doe", address: "8 Avenue des clients", zip_code: "13010", city: "Marseille", country: "France", tel: "0652325685")
customer.role = customer_role
customer.save
p "ADMIN USER CREATED ============================================================"
p customer
p "==============================================================================="