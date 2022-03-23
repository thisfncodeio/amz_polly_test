class CreateFactInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.integer :employee_id, null: false
      t.integer :building_id, null: false
      t.integer :battery_id
      t.integer :column_id
      t.integer :elevator_id
      t.datetime :intervention_start_time, null: false
      t.datetime :intervention_end_time
      t.string :result, null: false
      t.string :report
      t.string :status, null: false
    end
  end
end
