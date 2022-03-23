class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :company_name
      # t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :building_type
      t.string :apartments
      t.string :floors
      t.string :basements
      t.string :elevators
      t.string :companies
      t.string :parking_spots
      t.string :corporations
      t.string :maximum_occupancy
      t.string :business_hours
      t.string :services_type
      t.string :amount_of_elevator
      t.string :price_per_elevator
      t.string :installation
      t.string :price_elevator_total
      t.string :total_price

      t.timestamps
    end
  end
end
