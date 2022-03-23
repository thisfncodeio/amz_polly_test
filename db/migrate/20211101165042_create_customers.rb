class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
    
      t.string :company_name
      t.string :company_contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :company_description
      t.string :service_tech_name
      t.string :service_tech_phone
      t.string :service_tech_email

      t.timestamps
    end
  end
end
