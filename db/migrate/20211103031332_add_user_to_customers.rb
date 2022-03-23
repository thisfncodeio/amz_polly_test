class AddUserToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :user, foreign_key: { on_delete: :cascade, on_update: :cascade } 
  end
end
