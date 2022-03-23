class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :admin_name
      t.string :admin_email
      t.string :admin_phone_numer
      t.string :tech_full_name
      t.string :tech_email
      t.string :tech_phone_number

      t.timestamps
    end
  end
end
