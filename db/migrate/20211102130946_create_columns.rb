class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :column_type
      t.integer :number_of_floor
      t.string :status
      t.string :information
      t.text :notes

      t.timestamps
    end
  end
end
