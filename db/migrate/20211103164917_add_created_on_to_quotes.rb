class AddCreatedOnToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :created_on, :date
  end
end
