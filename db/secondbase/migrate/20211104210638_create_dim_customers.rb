class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.date :creation_date
      t.string :company_name
      t.string :main_contact_full_name
      t.string :main_contact_email
      t.integer :number_of_elevators
      t.string :customer_city
    end
  end
end
