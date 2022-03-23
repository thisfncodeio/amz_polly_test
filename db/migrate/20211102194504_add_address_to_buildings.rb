class AddAddressToBuildings < ActiveRecord::Migration[5.2]
  def change
     add_reference :buildings, :address, foreign_key: { on_delete: :cascade, on_update: :cascade } 
  end
end
