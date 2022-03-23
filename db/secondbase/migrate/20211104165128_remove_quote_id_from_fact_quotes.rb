class RemoveQuoteIdFromFactQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :fact_quotes, :quote_id, :integer
  end
end
