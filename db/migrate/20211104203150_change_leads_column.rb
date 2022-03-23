class ChangeLeadsColumn < ActiveRecord::Migration[5.2]
  def change
    # We're changing the leads column to have a limit of WHATEVER, could be 5, 10, 32, etc.
    change_column :leads, :attachment, :binary, :limit => 16.megabyte 
  end
end
