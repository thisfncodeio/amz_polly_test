class AddCreatedOnToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :created_on, :date
  end
end
