class AddBatteryToColumns < ActiveRecord::Migration[5.2]
  def change
    add_reference :columns, :battery, foreign_key: { on_delete: :cascade, on_update: :cascade }
  end
end
