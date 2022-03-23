class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :company_name
      t.string :email
      t.string :phone_number
      t.string :project_name
      t.text :project_description
      t.string :department
      t.text :message , :limit => 700000
      t.binary :attachment

      t.timestamps 
    end
  end
end
